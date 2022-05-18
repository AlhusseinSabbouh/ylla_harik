import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ylla_harik/constants/constants.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final Constants constants;
  LanguageCubit(this.constants)
      : lang = constants.lang,
        showAllgames = constants.word![constants.showAllGames],
        arabic = constants.word![constants.arabic],
        english = constants.word![constants.english],
        setLanguage = constants.word![constants.setLanguage],
        setting = constants.word![constants.Setting],
        login = constants.word![constants.Login],
        addNewGame = constants.word![constants.addNewGame],
        homePage = constants.word![constants.homePage],
        enterTitle = constants.word![constants.enterTitle],
        enterDisc = constants.word![constants.enterDisc],
        enterPlayerNumber = constants.word![constants.enterPlayerNumber],
        choseImage = constants.word![constants.choseImage],
        addDate = constants.word![constants.addDate],
        addTime = constants.word![constants.addTime],
        no = constants.word![constants.no],
        yes = constants.word![constants.yes],
        youWillDelete = constants.word![constants.youWillDelete],
        applyDelete = constants.word![constants.applyDelete],
        editGame = constants.word![constants.editGame],
        player = constants.word![constants.player],
        maxPlayeris = constants.word![constants.maxPlayeris],
        allGames = constants.word![constants.allGames],
        errorTitle = constants.word![constants.errorTitle],
        errorNumberPlayer = constants.word![constants.errorNumberPlayer],
        errorStringPlayer = constants.word![constants.errorStringPlayer],
        canYoucame = constants.word![constants.canYoucame],
        inviteFriend = constants.word![constants.inviteFriend],
        yourFriendNumber = constants.word![constants.yourFriendNumber],
        gameOn = constants.word![constants.gameOn],
        errorShortNumber = constants.word![constants.errorShortNumber],
        errorEnterRightValue = constants.word![constants.errorEnterRightValue],
        at = constants.word![constants.at],
        sendSms = constants.word![constants.sendSms],
        noGames = constants.word![constants.noGames],
        month = constants.word![constants.month],
        day = constants.word![constants.day],
        super(LanguageInitial());

  String? canYoucame;
  String? inviteFriend;
  String? yourFriendNumber;
  String? gameOn;
  String? errorShortNumber;
  String? errorEnterRightValue;
  String? at;

  String? addNewGame;
  String? setting;
  String? login;
  String? setLanguage;
  String? showAllgames;
  String? arabic;
  String? english;

  String? homePage;
  String? enterTitle;
  String? enterDisc;
  String? enterPlayerNumber;
  String? choseImage;
  String? addDate;
  String? addTime;

  String? allGames;
  String? maxPlayeris;
  String? player;
  String? editGame;
  String? applyDelete;
  String? yes;
  String? no;
  String? youWillDelete;

  String? errorTitle;
  String? errorNumberPlayer;
  String? errorStringPlayer;
  String? sendSms;
  String? noGames;
  String? month;
  String? day;

  String? lang;

  updateLang(String langu) async {
    constants.lang = langu;
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString('lang', langu);
    await constants.getWord();

    this.setting = constants.word![constants.Setting];
    this.login = constants.word![constants.Login];
    this.addNewGame = constants.word![constants.addNewGame];
    this.setLanguage = constants.word![constants.setLanguage];
    this.arabic = constants.word![constants.arabic];
    this.english = constants.word![constants.english];
    this.showAllgames = constants.word![constants.showAllGames];
    this.homePage = constants.word![constants.homePage];
    this.enterTitle = constants.word![constants.enterTitle];
    this.enterDisc = constants.word![constants.enterDisc];
    this.enterPlayerNumber = constants.word![constants.enterPlayerNumber];
    this.choseImage = constants.word![constants.choseImage];
    this.addDate = constants.word![constants.addDate];
    this.addTime = constants.word![constants.addTime];

    this.allGames = constants.word![constants.allGames];
    this.maxPlayeris = constants.word![constants.maxPlayeris];
    this.player = constants.word![constants.player];
    this.editGame = constants.word![constants.editGame];
    this.applyDelete = constants.word![constants.applyDelete];
    this.yes = constants.word![constants.yes];
    this.no = constants.word![constants.no];
    this.youWillDelete = constants.word![constants.youWillDelete];

    this.errorTitle = constants.word![constants.errorTitle];
    this.errorNumberPlayer = constants.word![constants.errorNumberPlayer];
    this.errorStringPlayer = constants.word![constants.errorStringPlayer];

    this.canYoucame = constants.word![constants.canYoucame];
    this.inviteFriend = constants.word![constants.inviteFriend];
    this.yourFriendNumber = constants.word![constants.yourFriendNumber];
    this.gameOn = constants.word![constants.gameOn];
    this.errorShortNumber = constants.word![constants.errorShortNumber];
    this.errorEnterRightValue = constants.word![constants.errorEnterRightValue];
    this.at = constants.word![constants.at];
    this.sendSms = constants.word![constants.sendSms];
    this.noGames = constants.word![constants.noGames];

    this.month = constants.word![constants.month];
    this.day = constants.word![constants.day];
  }

  getLang() {
    return lang;
  }
}
