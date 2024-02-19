// ignore_for_file: file_names

///
/// TABLE NAMES
///
enum TableName {
  ///
  model1,

  /// table images
  image,
}

// ================================
/// xxxxx xxxxxx
///
class Model1 {
  static final List<String> keys = [
    "_id",
    "xxxxxx", // TODO: any
    "xxxxxx", // TODO: any
    "attributes",
  ];

  static final List<String> types = [
    Helper.pk.type,
    Helper.txt.type, // TODO: any
    Helper.txt.type, // TODO: any
    Helper.txt.type,
  ];

  static String get sql {
    String value = '';

    for (var i = 0; i < keys.length; i++) {
      value += ' ${keys[i]} ${types[i]}';
      if (i != (keys.length - 1)) value += ', ';
    }

    return value;
  }
}

// ===============================

///
/// TYPES HELPERS
///
enum Helper {
  pk("INTEGER PRIMARY KEY AUTOINCREMENT"),

  txt("TEXT"),

  intT("INTEGER"),

  real("REAL"),

  lng("SIGNED BIGINT");

  const Helper(this.type);
  final String type;
}

///
/// DB HELPER
///
class DbHelper {
  /// sql from model1
  static String get sqlCreateModel1 {
    return 'CREATE TABLE ${TableName.model1.name} (${Model1.sql})';
  }

  /// sql from model1
  static String get sqlCreateModel2 {
    return 'CREATE TABLE ${TableName.model1.name} (${Model1.sql})';
  }
}
