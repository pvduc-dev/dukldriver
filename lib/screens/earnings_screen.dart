import 'package:flutter/material.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Thu nhập'),
        bottom: TabBar(
          controller: _tabController,
          dividerColor: Colors.grey[200],
          indicatorColor: Theme.of(context).colorScheme.primary,
          tabs: const [
            Tab(text: 'Ngày'),
            Tab(text: 'Tuần'),
            Tab(text: 'Tháng'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEarningsTab(
            totalEarnings: '500.000đ',
            totalTrips: 8,
            period: 'Hôm nay',
          ),
          _buildEarningsTab(
            totalEarnings: '3.500.000đ',
            totalTrips: 45,
            period: 'Tuần này',
          ),
          _buildEarningsTab(
            totalEarnings: '15.000.000đ',
            totalTrips: 180,
            period: 'Tháng này',
          ),
        ],
      ),
    );
  }

  Widget _buildEarningsTab({
    required String totalEarnings,
    required int totalTrips,
    required String period,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Tổng thu nhập $period',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    totalEarnings,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.directions_car),
                      const SizedBox(width: 8),
                      Text(
                        '$totalTrips chuyến xe',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Chi tiết các chuyến xe',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.local_taxi),
                  title: Text('Chuyến ${index + 1}'),
                  subtitle: Text('${DateTime.now().subtract(Duration(hours: index))}'),
                  trailing: Text(
                    '${(index + 1) * 50000}đ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
