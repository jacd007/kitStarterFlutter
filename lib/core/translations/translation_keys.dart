import '../../presentation/presentation.dart';

/// [Tk] class to translations
///
/// Contain `String` keys
///
/// To place parameter, place the name of the parameter with the @ symbol,
/// then to replace this field use the .trParam method with the Map with the
/// same name as previously.
/// ```
/// {
///   'list': "@param list",
///   'count':"count: @number"
/// }
///
/// ...
///
/// var text = 'list'.trParam({"param": "Validate"});
/// print(text); // output: "Validate list"
///
/// var text2 = 'count'.trParam({"number": 50});
/// print(text2); // output: "count: 50"
///
/// ```
///
/// For plural of a word or phrase use the same noun ending in "Plural".
/// Example: "list" in singular and "listPlural" in plural together with its correct
/// writing in singular and plural.
///
/// ```
/// {
///   'list': "list",
///   'listPlural':"lists"
/// }
///
/// ...
///
/// var text = 'list'.trPlural('listPlural', 1);
/// print(text); // output: "list"
///
/// var text2 = 'list'.trPlural('listPlural', 2);
/// print(text2); // output: "lists"
/// ```
///
class Tk {
  static const String locale = 'locale';
  static const String titleApp = 'titleApp';

  // =========================== Basics ===========================

  static const String accept = 'accept';
  static const String cancel = 'cancel';
  static const String send = 'send';
  static const String save = 'save';
  static const String delete = 'delete';
  static const String forget = 'forget';
  static const String toastTitleExit = 'toastTitleExit';
  static const String toastMsgExit = 'toastMsgExit';
  static const String pageError = 'pageError';

  static const String tMenu1 = "menu1";
  static const String tMenu2 = "menu2";
  static const String tMenu3 = "menu3";
  static const String tMenu4 = "menu4";
  static const String tMenu5 = "menu5";
  static const String titleFavoriteDeleted = "titleFavoriteDeleted";
  static const String titleFavoriteAdded = "titleFavoriteAdded";
  static const String titlePageRegNews = 'titlePageRegNews';
  static const String lookingForIn = "lookingForIn";
  static const String searchNews = "searchNews";
  static const String titleRegName = "titleRegName";
  static const String titleRegContact = "titleRegContact";
  static const String titleRegRole = "titleRegRole";
  static const String titleRegPhone = "titleRegPhone";
  static const String titleRegWsp = "titleRegWsp";
  static const String titleRegEmail = "titleRegEmail";
  static const String titleRegAddress = "titleRegAddress";
  static const String titleRegCity = "titleRegCity";
  static const String notCategory = 'notCategory';
  static const String viewMore = 'viewMore';
  static const String viewLoading1 = 'viewLoading1';
  static const String notLocalByCategory = 'notLocalByCategory';
  static const String positionHistory = 'positionHistory';
  static const String titleBtnRegister = 'titleBtnRegister';
  static const String titleDeleteParam = 'titleDeleteParam';
  static const String contentDeleteParam = 'contentDeleteParam';
  static const String thisReport = 'thisReport';
  static const String report = 'report';
  static const String status = 'status';
  static const String incidentDescription = 'incidentDescription';
  static const String incident = 'incident';
  static const String subject = 'subject';
  static const String subjectParam = 'subjectParam';
  static const String sos = 'sos';
  static const String myRed = 'myRed';
  static const String police = 'police';
  static const String medic = 'medic';
  static const String fire = 'fire';
  static const String open = 'open';
  static const String closed = 'closed';
  //
  static const String titleNotResponse = 'titleNotResponse';
  static const String msgNotResponse = 'msgNotResponse';
  static const String helpUs = 'helpUs';
  static const String advisory = 'advisory';
  static const String notAdvisoryContact = 'notContact';
  static const String policies = 'policies';
  static const String releaseDevice = 'releaseDevice';
  static const String noCachedFiles = 'noCachedFiles';
  static const String redirected = 'Redirected';

  // Singular and plural
  static const String item = 'item';
  static const String titleMall = 'titleMall';
  static const String name = 'name';
  static const String business = 'business';
  static const String contact = 'contact';
  static const String category = 'category';
  static const String shop = 'shop';
  static const String license = 'license';
  static const String plan = 'plan';
  static const String card = 'card';
  static const String vCard = 'vCard';
  static const String ourBrands = 'ourBrands';
  static const String searchCommerce = 'searchCommerce';
  static const String thereIsNoP = 'thereIsNoP';
  static const String thereIsNoCategories = 'thereIsNoCategories';
  static const String thereIsNoCommerces = 'thereIsNoCommerces';
  static const String thereIsNoNews = 'thereIsNoNews';
  static const String searchP = 'searchP';
}

extension PluralString on String {
  /// `Extended` get method of the `String class` to transform the words saved
  /// in `TranslationKey`
  String get toPlural {
    const plural = 'Plural';
    return '$this$plural';
  }

  /// `Extended` get method of the `String class` to transform the words saved
  /// in `TranslationKey`
  String trToPlural([int? i]) {
    final aux = i ?? 1;
    final width = aux < 1 ? 1 : aux;
    final plural = trPlural(toPlural, width);
    return plural;
  }
}
