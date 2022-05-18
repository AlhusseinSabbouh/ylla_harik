import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  String? lang;
  String? langAsis;

  Constants() {
    getWord();
  }

  final String Setting = 'Settings';
  final String Login = 'Login';
  final String addNewGame = 'addNewGame';
  final String setLanguage = 'setLanguage';
  final String showAllGames = 'showAllGames';
  final String arabic = 'arabic';
  final String english = 'english';
  final String homePage = 'homePage';
  final String enterTitle = 'enterTitle';
  final String enterDisc = 'enterDisc';
  final String enterPlayerNumber = 'enterPlayerNumber';
  final String choseImage = 'choseImage';
  final String addDate = 'addDate';
  final String addTime = 'addTime';

  final String allGames = 'allGames';
  final String maxPlayeris = 'maxPlayeris';
  final String player = 'player';
  final String editGame = 'editGame';
  final String applyDelete = 'applyDelete';
  final String yes = 'yes';
  final String no = 'no';
  final String youWillDelete = 'youWillDelete';

  final String errorTitle = 'errorTitle';
  final String errorNumberPlayer = 'errorNumberPlayer';
  final String errorStringPlayer = 'errorStringPlayer';

  final String canYoucame = 'canYoucame';
  final String inviteFriend = 'inviteFriend';
  final String yourFriendNumber = 'yourFriendNumber';
  final String gameOn = 'gameOn';
  final String errorShortNumber = 'errorShortNumber';
  final String errorEnterRightValue = 'errorEnterRightValue';
  final String at = 'at';
  final String sendSms = 'sendSms';
  final String noGames = 'noGames';

  final String month = 'month';
  final String day = 'day';

  Map<String, String>? word;

  Future<int> getWord() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    lang = preferences.getString('lang') ?? 'en';

    if (lang == 'en') {
      word = arabicMap;
    } else {
      word = englishMap;
    }

    return 0;
  }

  Map<String, String> arabicMap = {
    'Settings': 'Setting',
    'Login': 'Login',
    'addNewGame': 'Add new game',
    'setLanguage': 'Set language',
    'showAllGames': 'Show all games',
    'arabic': 'Arabic',
    'english': 'English',
    'homePage': 'Home page',
    'enterTitle': 'Enter the title',
    'enterDisc': 'Enter some description',
    'enterPlayerNumber': 'Enter the max number of people',
    'choseImage': 'Chose image',
    'addDate': 'Add game date',
    'addTime': 'Add game time',
    'allGames': 'All games',
    'maxPlayeris': 'Max players in this game : ',
    'player': ' player',
    'editGame': 'Edit game',
    'applyDelete': 'Delete !!!',
    'yes': 'Yes',
    'no': 'No',
    'youWillDelete': ' will be deleted ',
    'errorTitle': 'You must enter title',
    'errorNumberPlayer': 'The max number is 50',
    'errorStringPlayer': 'You must enter valid number',
    'canYoucame': 'Can you came to',
    'inviteFriend': 'Invite Friend',
    'yourFriendNumber': 'Your friend number',
    'gameOn': 'game on',
    'errorShortNumber': 'Short number',
    'errorEnterRightValue': 'Enter right number',
    'at': 'at',
    'sendSms': 'Send Sms',
    'noGames': "There aren't any game",
    'month': 'Month',
    'day': "Day",
  };

  Map<String, String> englishMap = {
    'Settings': 'الإعدادات',
    'Login': 'نسجيل الدخول',
    'addNewGame': 'أضف لعبة جديدة',
    'setLanguage': 'ضبط اللغة',
    'showAllGames': 'أظهر كافة الألعاب',
    'arabic': 'عربي',
    'english': 'إنكليزي',
    'homePage': 'الصفحة الرئيسية',
    'enterTitle': 'أدخل عنوان اللعبة',
    'enterDisc': 'أدخل تفاصيل اللعبة',
    'enterPlayerNumber': 'أدخل عدد اللاعبين',
    'choseImage': 'أضف صورة',
    'addDate': 'أضف تاريخ اللعبة',
    'addTime': 'أضف وقت اللعبة',
    'allGames': 'كل الألعاب',
    'maxPlayeris': 'عدد اللاعبين في هذه اللعبة هو : ',
    'player': ' لاعب',
    'editGame': 'تعديل اللعبة',
    'applyDelete': '  !!!  حذف',
    'yes': 'نعم',
    'no': 'لا',
    'youWillDelete': ' حذف  ',
    'errorTitle': 'يجب إضافة عنوان',
    'errorNumberPlayer': 'أكبر عدد مسموح هو 50 لاعب',
    'errorStringPlayer': 'يجب إدخال رقم صحيح',
    'canYoucame': 'هل يمكنك القدوم لسباق',
    'inviteFriend': 'دعوة صديق',
    'yourFriendNumber': 'أدخل رقم صديقك',
    'gameOn': 'واللعبة ستقام في تاريخ',
    'errorShortNumber': 'عدد الأرقام قليل',
    'errorEnterRightValue': 'أدخل رقم موبايل صحيح',
    'at': 'في تمام الساعة',
    'sendSms': 'أرسل الرسالة',
    'noGames': 'لا يوجد أي لعبة حالياً',
    'month': 'شهر',
    'day': "يوم",
  };
}

  // static final Constants _i = Constants.iner();
  // factory Constants(String lang) => _i;
  // Constants.iner(String lang){
  //   lang=lang;
  //   getWord();
  //   getLanguage();
  // }