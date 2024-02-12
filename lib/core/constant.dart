const kTheme = 'theme';

const kToken = 'token';                 //Auth Token
const kFirstTime = 'firstTime';         //Flag to show onBoarding Screen for new user
const kPinSetted = 'pin_setted';
const kTransPinSet = 'tran_pin_setted';
const kLocalAuthSetted = 'local_auth_setted';
const kLoggedUser = 'logged_user';    //Assuming if user logged with Pin as well
const kCurrentUser = 'current_user';

const Map<String, dynamic> cryptoData = {
  'btc': {
    'name': 'Bitcoin',
    'icon': 'assets/icons/btc.svg'
  },
  'bitcoin': {
    'name': 'Bitcoin',
    'icon': 'assets/icons/btc.svg'
  },
  'eth': {
    'name': 'Ethereum',
    'icon': 'assets/icons/eth.svg'
  },
  'ethereum': {
    'name': 'Ethereum',
    'icon': 'assets/icons/eth.svg'
  },
  'usdt': {
    'name': 'USDT',
    'icon': 'assets/icons/binance.svg'
  }
};

String accessCryptoIcon(String coinId) {
  String icon;
  if (cryptoData.containsKey(coinId.toLowerCase())) {
    icon = cryptoData[coinId.toLowerCase()]['icon'];
  } else {
    icon = 'assets/icons/binance.svg';
  }
  return icon;
}

String accessCryptoName(String coinId) {
  String name;
  if (cryptoData.containsKey(coinId.toLowerCase())) {
    name = cryptoData[coinId.toLowerCase()]['name'];
  } else {
    name = 'USTD';
  }
  return name;
}

const Map<String, double> withdrawalFee = {
  'btc': 0.001,
  'eth':  0.006,
  'usdt': 26
};

double getWithdrawalFee(String coinId) {
  double fee;
  if (withdrawalFee.containsKey(coinId.toLowerCase())) {
    fee = withdrawalFee[coinId.toLowerCase()]!;
  } else {
    fee = 0.001;
  }
  return fee;
}