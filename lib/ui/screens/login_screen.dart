import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';
import 'package:gcash_app_clone/core/enums/login_enum.dart';
import 'package:gcash_app_clone/core/providers/login_provider.dart';
import 'package:gcash_app_clone/core/services/auth_service.dart';
import 'package:gcash_app_clone/core/utils/navigator_context.dart';
import 'package:gcash_app_clone/data/mock_passcode.dart';
import 'package:gcash_app_clone/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

class GCashLoginScreen extends StatefulWidget {
  static String routeName = 'GCashLoginScreen';
  const GCashLoginScreen({super.key});

  @override
  State<GCashLoginScreen> createState() => _GCashLoginScreenState();
}

class _GCashLoginScreenState extends State<GCashLoginScreen> {
  List<String> input = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), biometricAuthDialog);
  }

  void _onKeyboardTap(String value) {
    if (value == 'fingerprint') {
      biometricAuthDialog();
    } else {
      if (input.length < 4) {
        setState(() {
          input.add(value);

          print(input.join());
          if (input.join() == Passcode.pin) {
            NavigatorContext.add(GCashHomeScreen.routeName);
          }
        });
      }
    }
  }

  void _onDelete() {
    if (input.isNotEmpty) {
      setState(() {
        input.removeLast();
      });
    }
  }

  void biometricAuthDialog() async {
    /*
    Dialogs.show(
      context,
      title: 'Log in with biometrics',
      widget: Center(
        child: Column(
          children: const [
            Icon(Icons.fingerprint, size: 60, color: AppColor.primaryDarkerColor),
            SizedBox(height: 20),
            Text(
              'Touch the fingerprint sensor',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      okBtnFunction: () {},
      cancelText: "USE MPIN",
    );*/

    bool isAuthenticated = await AuthService.authenticateUser();
    if (isAuthenticated) {
      NavigatorContext.add(GCashHomeScreen.routeName);
    }
  }

  Widget _buildCircle(bool filled) {
    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? Colors.white : Colors.transparent,
        border: Border.all(color: Colors.blue, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: () async {
          if (provider.selectedType != LoginTypeEnum.NONE) {
            provider.setSelectedType(LoginTypeEnum.NONE);
            return false;
          }
          return true;
        },
        child: Scaffold(
          backgroundColor:
              const Color(0xFF007AFF), // Background color similar to the image
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                // GCash logo
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                  ), // Placeholder for the GCash logo
                ),
                // "Good Day!" text
                const Text(
                  'Good Day!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // Phone number display
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '+63-9090200000',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0)),
                            ),
                            builder: (context) =>
                                _buildQuickBalanceSheet(context),
                          );
                        },
                        child: const Icon(
                          Icons.swap_horiz,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (provider.selectedType == LoginTypeEnum.MPIN) ...[
                  const SizedBox(height: 40),
                  // "Enter your MPIN" text
                  const Text(
                    'Enter your MPIN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // MPIN input circles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        4, (index) => _buildCircle(index < input.length)),
                  ),
                  const SizedBox(height: 30),
                  // Warning text
                  const Text(
                    'Never share your MPIN or OTP with anyone.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Numeric keypad
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildKeypadRow(['1', '2', '3']),
                          _buildKeypadRow(['4', '5', '6']),
                          _buildKeypadRow(['7', '8', '9']),
                          _buildKeypadRow(['fingerprint', '0', 'delete']),
                          const SizedBox(height: 10),
                          // Help Center and Forgot MPIN
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Help Center',
                                  style: TextStyle(
                                      color: AppColor.primaryDarkerColor),
                                ),
                                Text(
                                  'Forgot MPIN?',
                                  style: TextStyle(
                                      color: AppColor.primaryDarkerColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  const Spacer(),
                  // Login buttons
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  provider
                                      .setSelectedType(LoginTypeEnum.BIOMETRIC);
                                  biometricAuthDialog();
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.fingerprint,
                                      color: AppColor.primaryDarkerColor,
                                      size: 36,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Biometrics Login',
                                      style: TextStyle(
                                        color: AppColor.primaryDarkerColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  provider.setSelectedType(LoginTypeEnum.MPIN);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.dialpad,
                                      color: AppColor.primaryDarkerColor,
                                      size: 36,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'MPIN Login',
                                      style: TextStyle(
                                        color: AppColor.primaryDarkerColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.8,
                    color: Colors.blue,
                  ),
                  // Help Center and Forgot MPIN
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Help Center',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Forgot MPIN?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Version number
                  const Text(
                    'v5.78.1:912',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildKeypadRow(List<String> values) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values.map((value) {
          return value.isEmpty
              ? const SizedBox(width: 80) // Placeholder for empty spots
              : _buildKeypadButton(value);
        }).toList(),
      ),
    );
  }

  Widget _buildKeypadButton(String value) {
    Widget content;
    if (value == 'fingerprint') {
      content = const Icon(Icons.fingerprint,
          size: 30, color: AppColor.primaryDarkerColor);
    } else if (value == 'delete') {
      content = const Icon(Icons.backspace_outlined,
          size: 30, color: AppColor.primaryDarkerColor);
    } else {
      content = Text(
        value,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryDarkerColor),
      );
    }
    return InkWell(
      onTap: value == 'delete' ? _onDelete : () => _onKeyboardTap(value),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: content,
      ),
    );
  }

  Widget _buildMPINSectionWidget() {
    return Column(
      children: const [],
    );
  }

  Widget _buildAuthSelectionWidget(LoginProvider provider) {
    return Column(
      children: [
        const Spacer(),
        // Login buttons
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        provider.setSelectedType(LoginTypeEnum.BIOMETRIC);
                        biometricAuthDialog();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.fingerprint,
                            color: AppColor.primaryDarkerColor,
                            size: 36,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Biometrics Login',
                            style: TextStyle(
                              color: AppColor.primaryDarkerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        provider.setSelectedType(LoginTypeEnum.MPIN);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.dialpad,
                            color: AppColor.primaryDarkerColor,
                            size: 36,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'MPIN Login',
                            style: TextStyle(
                              color: AppColor.primaryDarkerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 0.8,
          color: Colors.blue,
        ),
        // Help Center and Forgot MPIN
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Help Center',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Forgot MPIN?',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Version number
        const Text(
          'v5.78.1:912',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // Method to build the bottom sheet for Quick Balance
  Widget _buildQuickBalanceSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Your are about to switch accounts',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColor.primaryDarkerColor,
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                NavigatorContext.add(GCashHomeScreen.routeName);
              },
              child: const Text(
                'Proceed',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColor.primaryDarkerColor,
                backgroundColor: Colors.white,
                side: const BorderSide(color: AppColor.primaryDarkerColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
