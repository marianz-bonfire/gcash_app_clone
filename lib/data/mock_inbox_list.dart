import 'package:gcash_app_clone/data/models/inbox.dart';

class Inboxes {
  static List<Inbox> list = [
    Inbox(
      text: "Online Payment Successful!",
      description:
          "Your payment of P49.00 to Apple service has been successfully processed on 08-31-24 08:20:52 PM. Ref No. 23083219",
      date: 'Aug 31, 2024',
      isRead: true,
    ),
    Inbox(
      text: "GCash Funds Received!",
      description: "Your have received 1000.00 of GCash funds on 08-30-24 08:20:52 PM. Ref No. 23083219",
      date: 'Aug 30, 2024',
    ),
    Inbox(
      text: "Online Payment Failed!",
      description: "You dont't have enough balance to paid Apple service 07-23-24 10:20:52 PM. Ref No. 23083219",
      date: 'Jul 23, 2024',
    )
  ];
}
