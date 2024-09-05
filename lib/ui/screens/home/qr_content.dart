import 'package:flutter/material.dart';


class QRContent extends StatelessWidget {
  static String routeName = 'QRContent';

  const QRContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       SizedBox(
         height: MediaQuery.of(context).size.height,
         width: double.infinity,
         child: Container(
           color: Colors.black,
         ),
       )
      ],
    );
  }
}
