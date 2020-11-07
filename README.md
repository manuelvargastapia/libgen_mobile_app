# libgen

Non-official Library Genesis mobile app.

Built with Flutter and BLoC state managment pattern.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## TODO

- [ ] Cover URL error handling (ex: when HTTP request fails)
- [ ] Improve lazy loading of fetching books (ex: currently only show a SnackBar without proper feedback about what's going on with the loading, leading to bad experience)
- [ ] Find a good solution for constant and impredictable IP changes in Library Genesis (see _/home/manuel/development/libgen_mobile_app/flutter_app/libgen/android/app/src/main/res/xml/network_security_config.xml_ and the [API repo](https://github.com/manuelvargastapia/libgen_api/tree/master) for better understanding)
- [ ] Implement env files management ([check this package](https://pub.dev/packages/envify))
- [ ] Improve Bloc States to avoid using the optional parameter `String md5` in abstract class BookState
- [ ] Implement translations
- [ ] Unit testing
- [ ] Automated testing for Blocs ([check this package](https://pub.dev/packages/bloc_test))