import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';
import 'package:gcash_app_clone/data/models/inbox.dart';

class InboxItem extends StatelessWidget {
  final Inbox inbox;
  final VoidCallback onTap;
  const InboxItem({
    super.key,
    required this.onTap,
    required this.inbox,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (inbox.isRead) ...[
            const Icon(Icons.mail_outline_outlined, color: AppColor.primaryColor),
          ] else ...[
            Stack(
              children: [
                const Icon(Icons.mail_outline, color: AppColor.primaryDarkerColor),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    inbox.text,
                    style: TextStyle(fontSize: 18, color: inbox.isRead ? Colors.grey : AppColor.primaryDarkerColor),
                  ),
                  Text(
                    inbox.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Text(
            inbox.date,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
