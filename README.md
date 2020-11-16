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
- [ ] replace any debuggin error message
  - [ ] Network errors
- [ ] Improve lazy loading of fetching books:
  - [ ] Currently only show a SnackBar without proper feedback about what's going on with the loading, leading to bad experience.
  - [x] Clean current book list displayed before execute another query
  - [ ] Handle properly the case when there are no more books to fetch, to avoid fetching duplicates when the bottom of the screen is falsely reached by the list because of expanding the list tiles
- [ ] Find a good solution for constant and impredictable IP changes in Library Genesis (see _/home/manuel/development/libgen_mobile_app/flutter_app/libgen/android/app/src/main/res/xml/network_security_config.xml_ and the [API repo](https://github.com/manuelvargastapia/libgen_api/tree/master) for better understanding)
- [ ] Implement env files management ([check this package](https://pub.dev/packages/envify))
  - [ ] API URLs
  - [ ] Flutter Downloader initialization (set debug to `false`)
- [x] Improve Bloc States to avoid using the optional parameter `String md5` in abstract class BookState
- [ ] Implement translations
- [ ] Cache search results to avoid refetching after coming back from details
- [ ] Unit testing
- [ ] Work with [cached images](https://flutter.dev/docs/cookbook/images/cached-images)
- [ ] Considera using [replay_bloc](https://pub.dev/packages/replay_bloc) or [hydrated_bloc](https://pub.dev/packages/hydrated_bloc) to handle state conservation between navigation from search page to details
- [ ] Automated testing for Blocs ([check this package](https://pub.dev/packages/bloc_test))
- [ ] Find a better solution for permissions issues in Android 10: currently, a temporary solution has been implemented in `AndroidManifext.xml` (`android:requestLegacyExternalStorage="true"`). [Check this post](https://medium.com/@sriramaripirala/android-10-open-failed-eacces-permission-denied-da8b630a89df)
- [ ] Find a better solution for lint options issues associated to Gradle plugin ([see GitHub issue](https://github.com/flutter/flutter/issues/30598)). Currently, a temporary solution is being applied in `android/app/build.gradle` (`checkReleaseBuilds false)
- [ ] Update flutter_bloc package. See [migration guide](https://bloclibrary.dev/#/migration)
- [ ] Sometimes download fails unexpectedly
- [ ] Improve BLoC accesses by following clean practices. Check [videos](https://www.youtube.com/watch?v=w6XWjpBK4W8&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o)
- [ ] Request download permissions beforehand to prevent internal UI state management errors and better user experience
- [ ] Consider improving API calls error handling. [Check this post](https://medium.com/solidmvp-africa/making-your-api-calls-in-flutter-the-right-way-f0a03e35b4b1)
- [ ] Improve `import` statements
- [ ] Organize and handle Styles and Themes
- [ ] Consider usgin the built-in `close()` method of `showSearch()` to display book details
- [ ] Refactor download icon button's BlocConsumer
- [ ] Configure Dart analyzer to prevent positive falses ([check this issue](https://github.com/felangel/bloc/issues/587))
- [ ] Improve internal logic of filters in *lib/src/feature_search_book/widgets/book_list/show_filter_dialog.dart*
- [ ] Validar posibilidad de obtener más resultado usando conteo total de resultados
  - [ ] Retornar conteo total desde API
  - [ ] Usar conteo total para validar posibilidad de obtener más resultados
  - [ ] Mostrar conteo total en UI
- [ ] In details, replace AppBar title by search bar
- [ ] Show table of contents correctly
- [ ] Implement analytics or logging for better error tracking
- [ ] Be consistent in transition animations
  - [ ] Home to SearchDelegate vs SearchDelegate to Details
- [ ] Incluir otros filtros
  - [ ] Orden (asc o desc)
- [ ] Consider making only one API request instead of two (general search plus details), because potential cost-by-time constraint at the moment of release
  - [ ] `final BookBloc _bookBloc = BlocProvider.of<BookBloc>(context);`
- [ ] Be consisten in nomenclature choices ([check this guide](https://dart.dev/guides/language/effective-dart))
  - [ ] `show_filter_dialog.dart` should start with a noun phrase