import 'package:get/get.dart';
import 'package:razpay/features/auth/presentations/views/confirm_pin.dart';
import 'package:razpay/features/auth/presentations/views/create_new_password.dart';
import 'package:razpay/features/auth/presentations/views/create_pin.dart';
import 'package:razpay/features/auth/presentations/views/email_sent.dart';
import 'package:razpay/features/auth/presentations/views/forget_password.dart';
import 'package:razpay/features/auth/presentations/views/login.dart';
import 'package:razpay/features/auth/presentations/views/onboarding.dart';
import 'package:razpay/features/auth/presentations/views/pass_code.dart';
import 'package:razpay/features/auth/presentations/views/reset_verification_code.dart';
import 'package:razpay/features/auth/presentations/views/sign_up.dart';
import 'package:razpay/features/auth/presentations/views/splash.dart';
import 'package:razpay/features/auth/presentations/views/verification.dart';
import 'package:razpay/features/home/presentations/views/nav.dart';
import 'package:razpay/features/kyc/presentations/views/choose_document.dart';
import 'package:razpay/features/kyc/presentations/views/document.dart';
import 'package:razpay/features/kyc/presentations/views/document_back.dart';
import 'package:razpay/features/kyc/presentations/views/information.dart';
import 'package:razpay/features/kyc/presentations/views/kyc_successful.dart';
import 'package:razpay/features/kyc/presentations/views/scan_doc.dart';
import 'package:razpay/features/market/presentations/views/markets.dart';
import 'package:razpay/features/notifications/presentations/views/notification_details.dart';
import 'package:razpay/features/notifications/presentations/views/notifications.dart';
import 'package:razpay/features/profile/presentations/views/change_pass.dart';
import 'package:razpay/features/profile/presentations/views/my_account.dart';
import 'package:razpay/features/profile/presentations/views/profile.dart';
import 'package:razpay/features/send_crypto/presentations/views/address.dart';
import 'package:razpay/features/send_crypto/presentations/views/amount.dart';
import 'package:razpay/features/send_crypto/presentations/views/enter_pin.dart';
import 'package:razpay/features/send_crypto/presentations/views/failed.dart';
import 'package:razpay/features/send_crypto/presentations/views/preview.dart';
import 'package:razpay/features/send_crypto/presentations/views/successful.dart';
import 'package:razpay/features/transactions/presentations/views/transaction_detail.dart';
import 'package:razpay/features/transactions/presentations/views/transactions.dart';

class AppRoutes {
  static String splash = '/';
  static String onboarding = '/onboarding';
  static String welcome = '/welcome';
  static String login = '/login';
  static String passcode = '/pass_code';
  static String signUp = '/sign_up';
  static String forgotPassword = '/forgot_password';
  static String forgotPasswordVerification = '/forgot_password_verification';
  static String createPin = '/create_pin';
  static String confirmPin = '/confirm_pin';
  static String emailSent = '/email_sent';
  static String createNewPassword = '/create_new_password';
  static String verification = '/verification';
  static String kycChooseDoc = '/kyc_choose_doc';
  static String kycInfo = '/kyc_info';
  static String kyDoc = '/kyc_doc';
  static String kyDocBack = '/kyc_doc_back';
  static String kycDocumentScanDoc = '/kyc_scan_doc';
  static String kycCompleted = '/kyc_completed';
  static String mainHome = '/main_home';
  static String market = '/market';
  static String notifications = '/notifications';
  static String notificationDetails = '/notification_detail';
  static String transactions = '/transactions';
  static String transactionDetails = '/transaction_detail';
  static String sendCrypto = '/send_crypto';
  static String sendCryptoAddress = '/send_crypto_address';
  static String sendCryptoPin = '/send_crypto_pin';
  static String sendCryptoPreview = '/send_crypto_preview';
  static String sendCryptoSuccessful = '/send_crypto_successful';
  static String sendCryptoFailed = '/send_crypto_failed';
  static String profile = '/profile';
  static String changePassword = '/change_password';
  static String myAccount = '/my_account';
}

final appRouter = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.onboarding,
    page: () => const OnboardingScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignUpScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.forgotPassword,
    page: () => const ForgotPassword(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.forgotPasswordVerification,
    page: () => const ResetVerificationScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.createPin,
    page: () => const CreatePinScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.confirmPin,
    page: () => const ConfirmPinScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.emailSent,
    page: () => const EmailSentScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.createNewPassword,
    page: () => const CreateNewPassword(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.verification,
    page: () => const VerificationScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.kycDocumentScanDoc,
    page: () => const ScanDocumentScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.kycChooseDoc,
    page: () => const KYCChooseDocumentScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.kyDoc,
    page: () => const KYCDocumentScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.kyDocBack,
    page: () => const KYCDocumentBackScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.kycCompleted,
    page: () => const KYCSuccessfulScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.mainHome,
    page: () => const MainHomeNav(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.market,
    page: () => const MarketScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.notifications,
    page: () => const NotificationScreens(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.notificationDetails,
    page: () => const NotificationDetail(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.transactions,
    page: () => const TransactionScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.transactionDetails,
    page: () => const TransactionDetail(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.sendCrypto,
    page: () => const SendCryptoAmountScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.sendCryptoAddress,
    page: () => const SendCryptoAddress(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.sendCryptoPreview,
    page: () => const SendCryptoPreview(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.sendCryptoPin,
    page: () => const SendCryptoPin(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.sendCryptoSuccessful,
    page: () => const SendCryptoSuccessful(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.sendCryptoFailed,
    page: () => const SendCryptoFailed(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.profile,
    page: () => const ProfileScreen(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.changePassword,
    page: () => const ChangePassword(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.myAccount,
    page: () => const MyAccount(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.kycInfo,
    page: () => const KYCPersonalInformation(),
    binding: BindingsBuilder(() {}),
  ),
  GetPage(
    name: AppRoutes.passcode,
    page: () => const PasscodeLoginScreen(),
    binding: BindingsBuilder(() {}),
  ),
];
