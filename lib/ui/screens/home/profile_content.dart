import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';
import 'package:gcash_app_clone/ui/widgets/profile_item.dart';

class ProfileContent extends StatelessWidget {
  static String routeName = 'ProfileContent';

  const ProfileContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Profile Header
        /*
        Container(
          color: AppColor.primaryColor,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text('MD', style: TextStyle(fontSize: 24, color: AppColor.activeTextColor)),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marian',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '09090200000',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.verified, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Fully Verified',
                            style: TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.primaryColor,
                      onPrimary: Colors.blue,
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'View Benefits',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Back to School'),
                  ),
                ],
              ),
            ],
          ),
        ),

         */
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
        /*
        _buildMenuItem(Icons.score, 'GScore'),
        _buildMenuItem(Icons.description, 'Terms and Conditions'),
        _buildMenuItem(Icons.security, 'Privacy Choices'),
        _buildMenuItem(Icons.payment, 'Alipay+'),
        _buildMenuItem(Icons.card_giftcard, 'Voucher Pocket'),
        _buildMenuItem(Icons.local_offer, 'Promos'),
        _buildMenuItem(Icons.help, 'Help'),
        Divider(),
        _buildMenuItem(Icons.logout, 'Log Out'),

         */
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text, style: TextStyle(color: Colors.blue)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
      onTap: () {},
    );
  }
}
