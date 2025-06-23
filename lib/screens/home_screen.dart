import 'package:dukldriver/api/lib/openapi.dart';
import 'package:dukldriver/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DriverStatusEnum? driverStatus;
  Position? position;

  getPosition() async {
    position = await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  void _updateStatus(bool value) async {
    await context
        .read<ApiProvider>()
        .api
        .getDriversApi()
        .driversControllerUpdateDriverStatus(
          updateStatusDto: UpdateStatusDto(
            status: value
                ? UpdateStatusDtoStatusEnum.online
                : UpdateStatusDtoStatusEnum.offline,
            latestLocation: Location(
              coordinates: [position!.longitude, position!.latitude],
            ),
          ),
          extra: {'context': context, 'isLoading': true},
        );
    setState(() {
      driverStatus = value ? DriverStatusEnum.online : DriverStatusEnum.offline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang chủ'), centerTitle: true),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    driverStatus == DriverStatusEnum.online
                        ? 'Đang sẵn sàng'
                        : 'Không sẵn sàng',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: driverStatus == DriverStatusEnum.online
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Switch(
                    value: driverStatus == DriverStatusEnum.online,
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
                    driverStatus == DriverStatusEnum.online
                        ? 'Bạn đang sẵn sàng nhận thông báo về chuyến xe mới'
                        : 'Bật để bắt đầu nhận thông báo về chuyến xe mới',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
