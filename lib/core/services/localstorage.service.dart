import 'package:shared_preferences/shared_preferences.dart';

/*
  Отвечате за сохранение данных в локальную память
  Возвращает сохраненные данные из локальной памяти
  Удаляет данные из локальной памяти
*/
class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  // Keys
  static const String tokenKey = 'token';
  static const String languageKey = 'language';
  static const String quranTranslationAuthorKey = 'quranTranslationAuthorKey';
  static const String isArabicVisibleKey = 'isArabicVisibleKey';
  static const String isTranscriptVisibleKey = 'isTranscriptVisibleKey';
  static const String isTranslationVisibleKey = 'isTranslationVisibleKey';

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  void removeFromDisk(String key) {
    _preferences.remove(key);
  }

  Future clear() async {
    await _preferences.clear();
  }

  // Language
  String get language {
    final language = _getFromDisk(languageKey);

    if (language == null) {
      return null;
    }

    return language;
  }

  set language(String tag) {
    _saveToDisk(languageKey, tag);
  }

  // Quran author of translation
  String get quranTranslationAuthor {
    final author = _getFromDisk(quranTranslationAuthorKey);

    if (author == null) {
      return null;
    }

    return author;
  }

  set quranTranslationAuthor(String authorUsername) {
    _saveToDisk(quranTranslationAuthorKey, authorUsername);
  }

  // Arabic
  bool get isArabicVisible {
    final visible = _getFromDisk(isArabicVisibleKey);

    if (visible == null) {
      return true;
    }

    return visible;
  }

  set isArabicVisible(bool v) {
    _saveToDisk(isArabicVisibleKey, v);
  }

  // Transcript
  bool get isTranscriptVisible {
    final visible = _getFromDisk(isTranscriptVisibleKey);

    if (visible == null) {
      return true;
    }

    return visible;
  }

  set isTranscriptVisible(bool v) {
    _saveToDisk(isTranscriptVisibleKey, v);
  }

  // Translation
  bool get isTranslationVisible {
    final visible = _getFromDisk(isTranslationVisibleKey);

    if (visible == null) {
      return true;
    }

    return visible;
  }

  set isTranslationVisible(bool v) {
    _saveToDisk(isTranslationVisibleKey, v);
  }
}
