import 'package:flutter/material.dart';

class TransactionsContent extends StatelessWidget {
  static String routeName = 'TransactionsContent';

  TransactionsContent({super.key});

  final List<Map<String, dynamic>> transactions = [
    {'date': 'Aug 31, 2024', 'time': '8:20 PM', 'description': 'Online Payment - Auto Debit', 'amount': '-49.00'},
    {'date': 'Aug 30, 2024', 'time': '4:18 PM', 'description': 'Cashin from BDO Unibank', 'amount': '+1,000.00'},
    {'date': 'Aug 13, 2024', 'time': '8:18 AM', 'description': 'Send Money', 'amount': '-170.00'},
    {'date': 'Jul 16, 2024', 'time': '7:20 PM', 'description': 'Send Money', 'amount': '-30.00'},
    {'date': 'Jul 16, 2024', 'time': '7:17 PM', 'description': 'Send Money', 'amount': '-30.00'},
    {'date': 'Jul 15, 2024', 'time': '7:00 PM', 'description': 'Send Money', 'amount': '-30.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return _buildTransactionItem(transaction);
      }).toList(),
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 1, color: Colors.grey[300]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            transaction['date'],
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(transaction['description'], style: TextStyle(fontSize: 16.0)),
          subtitle: Text(transaction['time'], style: TextStyle(fontSize: 14.0, color: Colors.grey)),
          trailing: Text(transaction['amount'], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
