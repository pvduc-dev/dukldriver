import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        centerTitle: true,
      ),
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
                  setState(() {
                    _isAvailable = value;
                  });
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
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
