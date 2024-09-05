import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/utils/navigator_context.dart';
import 'package:gcash_app_clone/data/mock_inbox_list.dart';
import 'package:gcash_app_clone/ui/screens/inbox_message_screen.dart';
import 'package:gcash_app_clone/ui/widgets/inbox_item.dart';

class InboxContent extends StatelessWidget {
  static String routeName = 'InboxContent';

  const InboxContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.orange, // border color
                  shape: BoxShape.circle,
                ),
                child: Container(),
              ),
              const SizedBox(width: 8),
              const Text(
                'INBOX',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: Inboxes.list.map((inbox) {
              return Column(
                children: [
                  InboxItem(inbox: inbox, onTap: () {
                    NavigatorContext.add(InboxMessageScreen.routeName);
                  }),
                  Divider(),
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
