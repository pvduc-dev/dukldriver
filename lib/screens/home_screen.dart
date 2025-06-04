import 'package:dukldriver/api/lib/openapi.dart';
import 'package:dukldriver/provider/api_provider.dart';
import 'package:dukldriver/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAvailable = false;

  @override
  void initState() {
    super.initState();
    _isAvailable = context.read<AuthProvider>().me?.isAvailable ?? false;
  }

  void _updateStatus(bool value) async {
    await context
        .read<ApiProvider>()
        .api
        .getDriversApi()
        .driversControllerUpdateDriverStatus(
          updateStatusDto: UpdateStatusDto(isAvailable: value),
          extra: {'context': context, 'isLoading': true},
        );
    setState(() {
      _isAvailable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang chủ'), centerTitle: true),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isAvailable ? 'Đang sẵn sàng' : 'Không sẵn sàng',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isAvailable ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Switch(
                value: _isAvailable,
                onChanged: (value) {
                  _updateStatus(value);
                },
                activeColor: Colors.green,
                activeTrackColor: Colors.green.withOpacity(0.5),
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.red.withOpacity(0.5),
              ),
              const SizedBox(height: 20),
              Text(
                _isAvailable
                    ? 'Bạn đang sẵn sàng nhận thông báo về chuyến xe mới'
                    : 'Bật để bắt đầu nhận thông báo về chuyến xe mới',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
