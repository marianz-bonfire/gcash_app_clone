import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';
import 'package:gcash_app_clone/data/mock_data.dart';
import 'package:gcash_app_clone/ui/widgets/service_image_button.dart';

class HomeContent extends StatelessWidget {
  static String routeName = 'HomeContent';

  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 10),
        _buildWalletSection(),
        const SizedBox(height: 20),
        _buildQuickActions(),
        const SizedBox(height: 20),
        _buildPromotionsSection(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      // color: const Color(0xFFFFA726), // Orange color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Image(
                    image: AssetImage('assets/images/gcash.png'),
                    width: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Hello!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryDarkerColor,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryDarkerColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0),
                child: const Text('HELP'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.primaryColor, // GCash blue
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Wallet',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Text(
                  'AVAILABLE BALANCE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₱ ${MockData.accountBalance}',
                  style: const TextStyle(
                    fontFamily: 'Tahoma',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        '+ Cash In',
                        style: TextStyle(
                          color: AppColor.primaryDarkerColor, // GCash blue
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      //childAspectRatio: 0.75,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ServiceImageButton(image: 'assets/icons/send.png', text: 'Send', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/load.png', text: 'Load', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/transfer.png', text: 'Transfer', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/bills.png', text: 'Bills', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/borrow.png', text: 'Borrow', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/gsave.png', text: 'GSave', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/ginsure.png', text: 'GInsure', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/ginvest.png', text: 'GInvest', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/glife.png', text: 'GLife', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/rewards.png', text: 'A+ Rewards', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/gforest.png', text: 'GForest', onTap: () {}),
        ServiceImageButton(image: 'assets/icons/cards.png', text: 'Cards', onTap: () {}),
      ],
    );
  }

  Widget _buildPromotionsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'GCash Exclusives',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/banners/banner1.png'),
                fit: BoxFit.fitWidth, // Options: cover, contain, fill, fitWidth, fitHeight, none, scaleDown
              ),
            ),
          ),
        ],
      ),
    );
  }
}
