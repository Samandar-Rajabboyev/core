<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A dart package for many helper methods fitting different situations.

## Features

- localizations
- theme
- extensions
    - dio_error
    - empty_padding
    - navigation
    - toast
- base class for repository
- base class for data
- base class for use case
- route_transitions
- [logger_service](#logger-service)
- [local_storage](#local-storage)
- [hide_keyboard](#hide-keyboard)

## Getting started

```yaml
  core:
    git: https://gitlab.com/softexteam/softexmobile/core.git
```

## Usage

### Hide Keyboard

```dart
hideKeyboard();
```

### Local Storage
```dart
String someKey = 'some_key';
String? someValue = 'some_value';

Set<String> keys = await Prefs.getKeys();

bool isContainsSomeKey = await Prefs.containsKey(someKey);

if (isContainsSomeKey) {
    await Prefs.setString(someKey, someValue);
} else {
    someVaule = await Prefs.getString(someKey);
}

Prefs.remove(someKey);
```

### Logger Service

🐛 Debug

```dart
Logger.d("Debug log.");
```

💡 Info

```dart
Logger.i("Info log.");
```

⚠️ Warning

```dart
Logger.w("Warning log.");
```

⛔ Error

```dart
Logger.e("Error log.");
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
