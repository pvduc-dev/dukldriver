import 'package:dukldriver/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class IncomingTripScreen extends StatefulWidget {
  const IncomingTripScreen({super.key, required this.tripId});
  final String tripId;

  @override
  State<IncomingTripScreen> createState() => _IncomingTripScreenState();
}

class _IncomingTripScreenState extends State<IncomingTripScreen> {
  String pickupName = '';
  String pickupDescription = '';
  String dropoffName = '';
  String dropoffDescription = '';
  String customerName = '';
  String customerPhone = '';
  double price = 0;
  int distance = 0;

  @override
  void initState() {
    super.initState();
    // _getTrip();
  }

  Future<void> _getTrip() async {
    final response = await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerGetTrip(id: widget.tripId);
    final trip = response.data;
    setState(() {
      pickupName = trip?.pickup?.name ?? '';
      pickupDescription = trip?.pickup?.description ?? '';
      dropoffName = trip?.dropoff?.name ?? '';
      dropoffDescription = trip?.dropoff?.description ?? '';
      customerName = 'Phan Văn Đức';
      customerPhone = '0865707906';
      price = trip?.price?.toDouble() ?? 0;
      distance = trip?.distance?.toInt() ?? 0;
    });
  }

  Future<void> _cancelTrip(BuildContext context) async {
    await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerRejectTrip(id: widget.tripId);
    if (!context.mounted) return;
    Navigator.pop(context);
  }

  Future<void> _acceptTrip(BuildContext context) async {
    await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerAcceptTrip(id: widget.tripId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Full màn hình nền trắng
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => _cancelTrip(context),
        ),
        title: const Text(
          'Thông tin chuyến đi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Giá tiền & phương thức thanh toán
              Row(
                children: [
                  const Text(
                    'Cước phí',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    NumberFormat.currency(
                      locale: 'vi',
                      symbol: 'đ',
                    ).format(price),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Khoảng cách & điểm dừng
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      '${distance}km',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const SizedBox(height: 12),
                    // Điểm đón
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.radio_button_checked,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pickupName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                pickupDescription,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Điểm đến
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, color: Colors.orange),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dropoffName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                dropoffDescription,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Nút nhận chuyến
              SizedBox(
                width: double.infinity,
                child: StreamBuilder<int>(
                  stream: Stream.periodic(
                    const Duration(seconds: 1),
                    (i) => 30 - i - 1,
                  ).take(30),
                  builder: (context, snapshot) {
                    final seconds = snapshot.data ?? 30;
                    final isTimeUp = seconds <= 0;

                    // Tự động đóng khi hết thời gian
                    if (isTimeUp) {
                      Future.microtask(() {
                        if (!context.mounted) return;
                        _cancelTrip(context);
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      });
                    }

                    return ElevatedButton(
                      onPressed: isTimeUp
                          ? null
                          : () {
                              _acceptTrip(context);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Nhận chuyến ($seconds)',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
