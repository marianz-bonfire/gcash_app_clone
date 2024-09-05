import 'package:flutter/material.dart';


class TransactionItem extends StatelessWidget {
  final String text;
  final String date;
  final String amount;
  final VoidCallback onTap;
  const TransactionItem({
    super.key,
    required this.onTap,
    required this.text,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(text), Text(date, style: TextStyle(fontSize: 10, color: Colors.grey))],
          ),
          Text(
            amount,
          )
        ],
      ),
    );
  }
}
