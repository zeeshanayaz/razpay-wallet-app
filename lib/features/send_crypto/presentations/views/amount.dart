import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/device.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class SendCryptoAmountScreen extends StatefulWidget {
  const SendCryptoAmountScreen({super.key});

  @override
  State<SendCryptoAmountScreen> createState() => _SendCryptoAmountScreenState();
}

class _SendCryptoAmountScreenState extends State<SendCryptoAmountScreen> {
  String selectedCoin = 'Bitcoin';
  List<String> coins = ['Bitcoin', 'Ethereum', 'Tether'];
  final amountController = TextEditingController();
  String pinInput = '';

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Send Crypto',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: isDark ? darkGrey : white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: isDark
                        ? []
                        : const [
                            BoxShadow(
                              offset: Offset(1, 5),
                              color: grey,
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              offset: Offset(5, 1),
                              color: grey,
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                          ],
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var item in coins) coinWid(name: item),
                            ],
                          ),
                        ),
                      ),
                      const SizedBoxH20(),
                      Text(
                        '0.003453 BTC Available',
                        style: textStyle14,
                      ),
                      const SizedBoxH20(),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: amountController,
                        keyboardType: TextInputType.none,
                        style: headerStyle.copyWith(fontSize: 40),
                        onChanged: (value) {
                          setState(() {
                            pinInput = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: '0.00',
                          hintStyle: headerStyle.copyWith(fontSize: 40),
                          border: noborder,
                          errorBorder: noborder,
                          enabledBorder: noborder,
                          focusedBorder: noborder,
                          disabledBorder: noborder,
                        ),
                      ),
                      const SizedBoxH20(),
                      CustomButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.sendCryptoAddress);
                        },
                        text: 'Continue',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            // decoration: const BoxDecoration(
            //     color: white,
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(30),
            //         topRight: Radius.circular(30))),
            height: height(context) * .45,
            width: double.infinity,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              runSpacing: 10,
              spacing: 10,
              children: buttons.map((String button) {
                return GestureDetector(
                  onTap: () async {
                    if (button == 'del' && pinInput.isNotEmpty) {
                      _handleDelete();
                    } else if (button == '*') {
                    } else {
                      _handleButtonPress(button);
                    }
                  },
                  child: Container(
                    width: width(context) * .3,
                    height: height(context) * .07,
                    padding: const EdgeInsets.all(10),
                    // color: black,
                    decoration: BoxDecoration(
                      color: isDark ? darkGrey : white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: isDark
                          ? []
                          : const [
                              BoxShadow(
                                offset: Offset(1, 5),
                                color: grey,
                                blurRadius: 20,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                offset: Offset(5, 1),
                                color: grey,
                                blurRadius: 20,
                                spreadRadius: 0,
                              ),
                            ],
                    ),
                    alignment: Alignment.center,
                    child: button == 'del'
                        ? const Icon(Icons.backspace_outlined)
                        : Text(
                            button,
                            style: textStyle18.copyWith(
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                            ),
                          ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget coinWid({required String name}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCoin = name;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: name == selectedCoin ? primary : grey),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              name == 'Bitcoin'
                  ? 'assets/icons/btc.svg'
                  : name == 'Ethereum'
                      ? 'assets/icons/eth.svg'
                      : 'assets/icons/binance.svg',
              width: 20,
              height: 20,
            ),
            const SizedBoxW5(),
            Text(
              name,
              style: textStyle12,
            ),
          ],
        ),
      ),
    );
  }

  void _handleDelete() {
    String currentText = amountController.text;
    if (currentText.isNotEmpty) {
      String updatedText = currentText.substring(0, currentText.length - 1);
      amountController.text = updatedText;
    }
  }

  void _handleButtonPress(String button) {
    String currentText = amountController.text;
    String updatedText = currentText + button;
    amountController.text = updatedText;
  }

  final List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    'del',
  ];
}
