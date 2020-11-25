# libgen

Non-official Library Genesis mobile app.

Built with Flutter and BLoC state managment pattern.

Open Source.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## TODO

- [x] Cover URL error handling (ex: when HTTP request fails)
- [x] Implement suggestions
- [x] Replace any debuggin error message
  - [x] Network errors
  - [x] Downloading events
- [x] Improve lazy loading of fetching books:
  - [x] Currently only show a SnackBar without proper feedback about what's going on with the loading, leading to bad experience.
  - [x] Clean current book list displayed before execute another query
  - [x] Handle properly the case when there are no more books to fetch, to avoid fetching duplicates when the bottom of the screen is falsely reached by the list because of expanding the list tiles
- [x] Improve Bloc States to avoid using the optional parameter `String md5` in abstract class BookState
- [x] Improve internal logic of filters in *lib/src/feature_search_book/widgets/book_list/show_filter_dialog.dart*
- [x] Validar posibilidad de obtener más resultado usando conteo total de resultados
  - [x] Retornar conteo total desde API
  - [x] Usar conteo total para validar posibilidad de obtener más resultados
  - [x] Mostrar conteo total en UI
- [x] Consider making only one API request instead of two (general search plus details), because potential cost-by-time constraint at the moment of release
- [ ] Find a good solution for constant and impredictable IP changes in Library Genesis (see _/home/manuel/development/libgen_mobile_app/flutter_app/libgen/android/app/src/main/res/xml/network_security_config.xml_ and the [API repo](https://github.com/manuelvargastapia/libgen_api/tree/master) for better understanding)
- [ ] Implement env files management ([check this package](https://pub.dev/packages/envify))
  - [ ] API URLs
  - [ ] Flutter Downloader initialization (set debug to `false`)
- [ ] Implement translations
- [ ] Cache search results to avoid refetching after coming back from details
- [ ] Unit testing
- [ ] Work with [cached images](https://flutter.dev/docs/cookbook/images/cached-images)
- [ ] Considera using [replay_bloc](https://pub.dev/packages/replay_bloc) or [hydrated_bloc](https://pub.dev/packages/hydrated_bloc) to handle state conservation between navigation from search page to details
- [ ] Automated testing for Blocs ([check this package](https://pub.dev/packages/bloc_test))
- [ ] Find a better solution for permissions issues in Android 10: currently, a temporary solution has been implemented in `AndroidManifext.xml` (`android:requestLegacyExternalStorage="true"`). [Check this post](https://medium.com/@sriramaripirala/android-10-open-failed-eacces-permission-denied-da8b630a89df)
- [ ] Find a better solution for lint options issues associated to Gradle plugin ([see GitHub issue](https://github.com/flutter/flutter/issues/30598)). Currently, a temporary solution is being applied in `android/app/build.gradle` (`checkReleaseBuilds false)
- [ ] Update flutter_bloc package. See [migration guide](https://bloclibrary.dev/#/migration)
- [ ] Improve BLoC accesses by following clean practices. Check [videos](https://www.youtube.com/watch?v=w6XWjpBK4W8&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o)
- [ ] Consider improving API calls error handling. [Check this post](https://medium.com/solidmvp-africa/making-your-api-calls-in-flutter-the-right-way-f0a03e35b4b1)
- [ ] Organize and handle Styles and Themes
- [ ] Configure Dart analyzer to prevent positive falses ([check this issue](https://github.com/felangel/bloc/issues/587))
  - [ ] `final BookBloc _bookBloc = BlocProvider.of<BookBloc>(context);`
- [ ] In details, replace AppBar title by search bar
- [ ] Show table of contents correctly (HTML issue)
- [ ] Implement analytics or logging for better error tracking
- [ ] Be consistent in transition animations
  - [ ] Home to SearchDelegate vs SearchDelegate to Details
- [ ] Consider make the filtering more user friendly
- [ ] Be consisten in nomenclature choices ([check this guide](https://dart.dev/guides/language/effective-dart))
  - [ ] `show_filter_dialog.dart` should start with a noun phrase
- [ ] Implement lazy boxes in Hive for large data sets
  - [ ] Portentially large data set of suggestions
  - [ ] API data cached
- [ ] Implement Either pattern to all repositories
- [ ] Control appropiately the error case when opening Hive box
- [ ] Handle potential issues (run after `flutter clean`): `Note: Some input files use or override a deprecated API.`
- [ ] Consider including a new screen to manage downloads
- [ ] File can't be opened directly tapping notification after downloading
- [ ] Reduce APK size before releasing:
  - You are building a fat APK that includes binaries for android-arm, android-arm64, android-x64.
If you are deploying the app to the Play Store, it's recommended to use app bundles or split the APK to reduce the APK size.
    To generate an app bundle, run:
        flutter build appbundle --target-platform android-arm,android-arm64,android-x64
        Learn more on: https://developer.android.com/guide/app-bundle
    To split the APKs per ABI, run:
        flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
        Learn more on:  https://developer.android.com/studio/build/configure-apk-splits#configure-abi-split