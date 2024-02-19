import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:razpay/core/colors.dart';

enum Providers { email, google, facebook, apple }

class BaseHelper {
  static setStatusBarColor(color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
    ));
  }

  static hideKeypad(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static launchBrowser(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
  }

  static launchDialer(phone) async {
    var url = "tel://$phone";
    if (await canLaunchUrl(Uri(path: url))) {
      await launchUrl(Uri(path: url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchMailBox(email) async {
    final url = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static showSnackBar(msg, {color, button}) {
    Get.showSnackbar(GetSnackBar(
      message: msg,
      borderRadius: 5,
      barBlur: 5,
      backgroundColor: color ?? primary,
      margin: const EdgeInsets.all(5),
      duration: const Duration(milliseconds: 2500),
      mainButton: button,
    ));
  }

  static String? splitFirstName(String? text) {
    if (text == null) return null;

    var v = text.split(' ');
    if (v.length == 1) {
      return v[0];
    } else if (v.length == 2) {
      return v[0];
    } else if (v.length >= 3) {
      return '${v[0]} ${v[1]}';
    }
    return '';
  }

  static String? splitLastName(String? text) {
    if (text == null) return null;

    String value = ' ';
    var v = text.split(' ');
    if (v.length == 1) {
      return value;
    } else if (v.length == 2) {
      value = v[1];
    } else if (v.length >= 3) {
      for (int i = 2; i < v.length; i++) {
        value = '$value${v[i]} ';
      }
    }
    return value;
  }

  bool isNumeric(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }

  static formatStringToDecimal(String stringValue, [int decimal = 0]) {
    double doubleValue = double.parse(stringValue);
    String formattedValue = doubleValue.toStringAsFixed(decimal);
    return formattedValue;
  }

  static String formatDate(String dateString, String format) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat(format).format(dateTime);
    return formattedDate;
  }
}
