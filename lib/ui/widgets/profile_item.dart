import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';

class ProfileItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  const ProfileItem({
    super.key,
    required this.onTap,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: AssetImage(image),
        width: 36,
      ),
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColor.activeTextColor),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
    /*
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColor.backgroundColor,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image(
                  image: AssetImage(image),
                  width: 36,
                ),
              ),
              Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColor.activeTextColor),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 14.0,
              ),
            ],
          ),
        ),
      ),
    );

     */
  }
}
