import 'package:dukldriver/api/lib/openapi.dart';
import 'package:dukldriver/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController _phoneController = TextEditingController();

  _onContinue(BuildContext context) async {
    final phone = _phoneController.text;
    final api = Provider.of<ApiProvider>(context, listen: false).api;
    await api.getAuthApi().authControllerRequestOtp(
      requestOtpRequestDto: RequestOtpRequestDto(phone: phone),
      extra: {'isLoading': true, 'context': context},
    );
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/otp', arguments: phone);
  }

  @override
  void initState() {
    super.initState();
    _phoneController.clear();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(title: const Text('Đăng nhập/Đăng ký')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Số điện thoại',
                    hintText: 'Nhập số điện thoại của bạn',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56, // Tăng chiều cao từ 48 lên 56
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      _onContinue(context);
                    },
                    child: const Text(
                      'Tiếp tục',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ), // Tăng kích thước chữ
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
