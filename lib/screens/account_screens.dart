import 'package:dukldriver/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  Future<void> _onLogout(BuildContext context) async {
    context.read<AuthProvider>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tài khoản'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.amber,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nguyễn Văn A',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '0123456789',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Thông tin cá nhân'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Xử lý khi nhấn vào thông tin cá nhân
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Cài đặt'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Xử lý khi nhấn vào cài đặt
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.security_outlined),
              title: const Text('Bảo mật'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Xử lý khi nhấn vào bảo mật
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Thông tin ứng dụng'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Xử lý khi nhấn vào thông tin ứng dụng
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Đăng xuất',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                _onLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
