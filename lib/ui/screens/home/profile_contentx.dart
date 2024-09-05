import 'package:flutter/material.dart';
import 'package:gcash_app_clone/ui/widgets/profile_item.dart';

class ProfileContentX extends StatelessWidget {
  static String routeName = 'ProfileContent';

  const ProfileContentX({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileItem(text: 'Profile Limits', image: 'assets/icons/profile_limits.png', onTap: () {}),
        ProfileItem(text: 'My Linked Accounts', image: 'assets/icons/linked_accounts.png', onTap: () {}),
        ProfileItem(text: 'My QR Codes', image: 'assets/icons/qr.png', onTap: () {}),
        ProfileItem(text: 'Settings', image: 'assets/icons/settings.png', onTap: () {}),
        ProfileItem(text: 'GScore', image: 'assets/icons/gscore.png', onTap: () {}),
        ProfileItem(text: 'Terms and Conditions', image: 'assets/icons/terms_conditions.png', onTap: () {}),
        ProfileItem(text: 'Privacy Choices', image: 'assets/icons/privacy_choices.png', onTap: () {}),
        ProfileItem(text: 'Alipay+', image: 'assets/icons/alipay.png', onTap: () {}),
        ProfileItem(text: 'Voucher Pocket', image: 'assets/icons/voucher_pocket.png', onTap: () {}),
        ProfileItem(text: 'Promos', image: 'assets/icons/promos.png', onTap: () {}),
        ProfileItem(text: 'Help', image: 'assets/icons/help.png', onTap: () {}),
        const SizedBox(height: 30),
        const Divider(),
        ProfileItem(text: 'Logout', image: 'assets/icons/logout.png', onTap: () {}),
      ],
    );
  }
}
