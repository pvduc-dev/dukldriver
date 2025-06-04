import 'package:dukldriver/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flashy_flushbar/flashy_flushbar.dart';

class DetailTripScreen extends StatefulWidget {
  final String tripId;
  const DetailTripScreen({super.key, required this.tripId});

  @override
  State<DetailTripScreen> createState() => _DetailTripScreenState();
}

class _DetailTripScreenState extends State<DetailTripScreen> {
  // Dữ liệu chuyến đi
  String pickupName = 'Trường Đại học FPT';
  String pickupDescription =
      'Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức';
  String dropoffName = 'Landmark 81';
  String dropoffDescription =
      '720A Điện Biên Phủ, Vinhomes Tân Cảng, Bình Thạnh, Thành phố Hồ Chí Minh';
  String customerName = 'Nguyễn Văn An';
  String customerPhone = '0912345678';
  int price = 300000;
  String status = 'accepted';

  @override
  void initState() {
    super.initState();
    // fetchTripDetail();
  }

  Future<void> fetchTripDetail() async {
    final response = await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerGetTrip(id: widget.tripId);
    setState(() {
      pickupName = response.data?.pickup?.name ?? '';
      pickupDescription = response.data?.pickup?.description ?? '';
      dropoffName = response.data?.dropoff?.name ?? '';
      dropoffDescription = response.data?.dropoff?.description ?? '';
      customerName = 'Phan Văn Đức';
      customerPhone = '0865707906';
    });
    // Nếu dùng API thực tế, hãy parse dữ liệu trả về và setState tương tự
  }

  Future<void> openMapWithAddress(String address) async {
    final query = Uri.encodeComponent(address);
    final googleUrl = 'https://www.google.com/maps/search/?api=1&query=$query';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(
        Uri.parse(googleUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Không thể mở Google Maps';
    }
  }

  Future<void> _onRejectTrip() async {
    await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerRejectTrip(id: widget.tripId);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  Future<void> _onCancelTrip() async {
    await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerCancelTrip(id: widget.tripId);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  Future<void> _onAcceptTrip() async {
    await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerAcceptTrip(id: widget.tripId);
  }

  Future<void> _onCompleteTrip() async {
    await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerCompleteTrip(id: widget.tripId);
  }

  Future<void> _onArriveTrip() async {
    await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerArriveTrip(id: widget.tripId);
  }

  void _onCopyCustomerPhone() {
    Clipboard.setData(ClipboardData(text: customerPhone));
    FlashyFlushbar(
      leadingWidget: const Icon(
        Icons.error_outline,
        color: Colors.black,
        size: 24,
      ),
      message: 'Đã sao chép số điện thoại',
      duration: const Duration(seconds: 1),
      trailingWidget: IconButton(
        icon: const Icon(Icons.close, color: Colors.black, size: 24),
        onPressed: () {
          FlashyFlushbar.cancel();
        },
      ),
      isDismissible: false,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: status != 'pending'
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => {Navigator.pop(context)},
                )
              : const SizedBox.shrink(),
        ),
        actions: [
          Builder(
            builder: (context) {
              switch (status) {
                case 'pending':
                  return TextButton(
                    onPressed: () => _onRejectTrip(),
                    child: const Text(
                      'Từ chối',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                case 'accepted':
                  return const SizedBox.shrink();
                case 'arrived':
                  return const SizedBox.shrink();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
        title: Builder(
          builder: (context) {
            switch (status) {
              case 'pending':
                return const Text(
                  'Chuyến đang chờ xác nhận',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                );
              case 'accepted':
                return const Text(
                  'Chuyến xe đang thực hiện',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                );
              case 'arrived':
                return const Text(
                  'Chuyến xe đang thực hiện',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                );
              default:
                return const Text(
                  'Chi tiết chuyến xe',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                );
            }
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Điểm đón khách
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Điểm đón khách',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          openMapWithAddress(pickupDescription);
                        },
                        icon: const Icon(
                          Icons.directions,
                          size: 18,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Chỉ đường',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          textStyle: const TextStyle(fontSize: 14),
                          minimumSize: const Size(0, 36),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.radio_button_checked,
                        color: Colors.blueAccent,
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
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              pickupDescription,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Điểm trả khách
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Điểm trả khách',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          openMapWithAddress(dropoffDescription);
                        },
                        icon: const Icon(
                          Icons.directions,
                          size: 18,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Chỉ đường',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          textStyle: const TextStyle(fontSize: 14),
                          minimumSize: const Size(0, 36),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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
                              dropoffName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              dropoffDescription,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Hành khách (xuống dưới cùng)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Khách hàng',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customerName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              customerPhone,
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: _onCopyCustomerPhone,
                        icon: const Icon(Icons.copy, color: Colors.grey),
                        tooltip: 'Sao chép',
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrl(
                            Uri.parse('tel:0865707906'),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        icon: const Icon(Icons.phone, color: Colors.teal),
                        tooltip: 'Gọi điện',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Giá cước
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Giá cước',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    NumberFormat.currency(
                      locale: 'vi',
                      symbol: 'đ',
                    ).format(price),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: Builder(
            builder: (context) {
              switch (status) {
                case 'pending':
                  return StreamBuilder<int>(
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
                          _onCancelTrip();
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        });
                      }

                      return ElevatedButton(
                        onPressed: isTimeUp
                            ? null
                            : () {
                                _onAcceptTrip();
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
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
                  );
                case 'accepted':
                  return ElevatedButton(
                    onPressed: () {
                      _onArriveTrip();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Đã đón khách thành công',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  );
                case 'arrived':
                  return ElevatedButton(
                    onPressed: () {
                      _onCompleteTrip();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Đã trả khách thành công',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  void _handleArrivedAtDropoff() async {
    await context
        .read<ApiProvider>()
        .api
        .getTripsApi()
        .tripsControllerCompleteTrip(id: widget.tripId);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }
}
