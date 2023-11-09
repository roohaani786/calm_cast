
import 'dart:convert';


class MapperFactory {
  static Map<Type, dynamic Function(dynamic)> constructors = {};

  static void registerConstructor<T>(
      T Function(dynamic) callback,
      ) {
    if (constructors[T] == null) constructors[T] = callback;
  }

  static void initialize() {
    // registerAuthConstructors();
    // registerOnboardingConstructors();
    // registerCreateTaskConstructors();
    // registerWellnessMapperConstructors();
    // registerMonthlyGoalsConstructors();
    // registerGetTaskConstructors();
  }

  static T? map<T>(dynamic json) {
    assert(
    constructors[T] != null,
    "A proper constructor callback must be registered for all api model classes. Couldn't find registry for $T",
    );

    if (json == null) return null;

    print("map function start");
    print(json);
    var xyz = jsonDecode(json);
    print("xyz");
    print(xyz);
    print(constructors[T]!(xyz));
    print("map function end");

    return constructors[T]!(xyz) as T;
  }

  /// Below methods are just helpers to avoid putting null checks at every json -> class conversion

  static T? mapItem<T>(dynamic json, T Function(dynamic) mapper) {
    if (json == null) return null;
    return mapper(json);
  }

  static List<T>? mapList<T>(List<dynamic>? json, T Function(dynamic) mapper) {
    if (json == null) return null;
    return json.map<T>(mapper).toList();
  }
}
