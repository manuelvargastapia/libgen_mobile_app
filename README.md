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
- [ ] Improve lazy loading of fetching books:
  - [ ] Currently only show a SnackBar without proper feedback about what's going on with the loading, leading to bad experience.
  - [ ] Clean current book list displayed before execute another query
  - [ ] Handle properly the case when there are no more books to fetch, to avoid fetching duplicates when the bottom of the screen is falsely reached by the list because of expanding the list tiles
- [ ] Find a good solution for constant and impredictable IP changes in Library Genesis (see _/home/manuel/development/libgen_mobile_app/flutter_app/libgen/android/app/src/main/res/xml/network_security_config.xml_ and the [API repo](https://github.com/manuelvargastapia/libgen_api/tree/master) for better understanding)
- [ ] Implement env files management ([check this package](https://pub.dev/packages/envify))
- [x] Improve Bloc States to avoid using the optional parameter `String md5` in abstract class BookState
- [ ] Implement translations
- [ ] Unit testing
- [ ] Automated testing for Blocs ([check this package](https://pub.dev/packages/bloc_test))
- [ ] Find a better solution for permissions issues in Android 10: currently, a temporary solution has been implemented in `AndroidManifext.xml` (`android:requestLegacyExternalStorage="true"`). [Check this post](https://medium.com/@sriramaripirala/android-10-open-failed-eacces-permission-denied-da8b630a89df)
- [ ] Find a better solution for lint options issues associated to Gradle plugin ([see GitHub issue](https://github.com/flutter/flutter/issues/30598)). Currently, a temporary solution is being applied in `android/app/build.gradle` (`checkReleaseBuilds false)
- [ ] Update flutter_bloc package. See [migration guide](https://bloclibrary.dev/#/migration)
- [ ] Sometimes download fails unexpectedly
- [ ] Request download permissions beforehand to prevent internal UI state management errors
- [ ] Consider improving API calls error handling. [Check this post](https://medium.com/solidmvp-africa/making-your-api-calls-in-flutter-the-right-way-f0a03e35b4b1)