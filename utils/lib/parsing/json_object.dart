import 'dart:convert';

class JsonObject {
  JsonObject({this.json = const {}});

  final Map<String, dynamic> json;

  T? get<T>(String key) {
    return _getValue<T>(json[key]);
  }

  T? _getValue<T>(dynamic value) {
    if (T == List<bool>) {
      return _getList<bool>(value) as T;
    } else if (T == List<String>) {
      return _getList<String>(value) as T;
    } else if (T == List<int>) {
      return _getList<int>(value) as T;
    } else if (T == List<JsonObject>) {
      return _getList<JsonObject>(value) as T;
    } else if (T == bool || T == String || T == int) {
      return value as T?;
    } else if (T == JsonObject) {
      if (value == null) {
        return null;
      } else {
        return JsonObject(json: value) as T?;
      }
    } else {
      return null;
    }
  }

  List<T> getList<T>(String key) {
    return _getList(json[key]);
  }

  List<T> _getList<T>(dynamic value) {
    final List<T> result = [];
    final list = value as List<dynamic>?;
    if (list != null) {
      for (final item in list) {
        final elementValue = _getValue<T>(item);
        if (elementValue != null) {
          result.add(elementValue);
        }
      }
    }
    return result;
  }

  Map<K, T> getMap<K, T>(String key) {
    final Map<K, T> result = {};
    final value = json[key];
    final map = value as Map<String, dynamic>?;
    if (map != null) {
      for (final entry in map.entries) {
        final elementValue = _getValue<T>(entry.value);
        if (elementValue != null) {
          final K? key;
          if (K == int) {
            key = int.tryParse(entry.key) as K?;
          } else if (K == String) {
            key = entry.key as K;
          } else {
            key = null;
          }
          if (key != null) {
            result[key] = elementValue;
          }
        }
      }
    }
    return result;
  }

  factory JsonObject.fromString(String? string) {
    if (string == null) {
      return JsonObject();
    } else {
      return JsonObject(json: jsonDecode(string));
    }
  }
}
