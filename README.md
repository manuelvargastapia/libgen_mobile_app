# LibGen Mobile

This is a **non-offical** mobile client for Library Genesis service. It's an independent side project. Also, it's Open Source, so feel free to collaborate.

The app is built with Flutter and it'll be submitted to [FDroid](https://f-droid.org).

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Environment

We're managing the different stages of the app (basically, *development* and *production*) throught **compile time variables** (check [this article](https://binary-studio.com/2020/06/23/flutter-3/) for information). The only environmental variable in use right now is LIBGEN_MOBILE_API. This allow us to pass a development and production API URL directly from CLI commands.

To run the app with compile time variable, use the following command:

`flutter run --dart-define=LIBGEN_API_URL=<VALUE>`

Also, in VSCode, it could be useful define a `launch.json` file to debug. Such a file would look like this, for instance:

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "emulator",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define=LIBGEN_API_URL=http://10.0.2.2:3000",
            ]
        },
    ]
}
```

This flag also works with `flutter build apk` and others.

## Libgen API

Library Genesis doesn't provide a public API to work with, so we decided to build a *backend* service to consume. It's currently hosted in Heroku.

Check [the repo](https://github.com/manuelvargastapia/libgen_api/tree/master) to run your own instance and pass the corresponding URLs to the app throught compile time variables.

## Dependencies

The followings are all the official and third-party packages in use right now.

**Internationalization**

  - flutter_localizations:
    - sdk: flutter
  - [intl](https://pub.dev/packages/intl): ^0.16.1

Additionally, for generating the needed boilerplate we used the VSCode plugin [*Flutter Intl*](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl). This way, is recommended using this plugin to automatically generate new code for new locales. Unfortunately, [the offical docs](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) seems to be outdated.

**API requests**

  - [http](https://pub.dev/packages/http): ^0.12.2

**State manageent**

  - [flutter_bloc](https://pub.dev/packages/flutter_bloc): ^6.0.6
  - [hydrated_bloc](https://pub.dev/packages/hydrated_bloc): ^6.1.0

**Code generation**

  - [json_annotation](https://pub.dev/packages/json_annotation): ^3.1.0
  - [build_runner](https://pub.dev/packages/build_runner): ^1.10.3
  - [json_serializable](https://pub.dev/packages/json_serializable): ^3.5.0
  - [hive_generator](https://pub.dev/packages/hive_generator): ^0.8.2
  - [equatable](https://pub.dev/packages/equatable): ^1.2.5

**Downloads**

For downloading, we're using a fork of *flutter_downloader* package. Check `pubspec.yaml` for details.

  - [flutter_downloader](https://pub.dev/packages/flutter_downloader)
  - [downloads_path_provider](https://pub.dev/packages/downloads_path_provider): ^0.1.0
  - [permission_handler](https://pub.dev/packages/permission_handler): ^5.0.1+1
  
**Open download link in browser**

  - [url_launcher](https://pub.dev/packages/url_launcher): ^5.7.10

**Render HTML content**

For rendering HTML, we're using a fork of *simple_html_css* package. Check `pubspec.yaml` for details.

  - [simple_html_css](https://pub.dev/packages/simple_html_css)

**Local storage**

  - [hive](https://pub.dev/packages/hive): ^1.4.4+1
  - [hive_flutter](https://pub.dev/packages/hive_flutter): ^0.3.1

**Others**

  - [dartz](https://pub.dev/packages/dartz): ^0.9.2
  - [expandable](https://pub.dev/packages/expandable): ^4.1.4
  - [package_info](https://pub.dev/packages/package_info): ^0.4.3+2


## TODO

This is a 

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
- [x] Control layout of "No results for..." message (eg: it use max width when search term is large). Same for suggestions
- [x] Remove unused Bloc States and Events
- [x] Implement translations
- [x] Cache search results to avoid refetching after coming back from details
- [x] File can't be opened directly tapping notification after downloading
- [x] Organize and handle Styles and Themes
- [x] Be consistent in transition animations
  - [x] Home to SearchDelegate vs SearchDelegate to Details
- [x] Consider make the filtering more user friendly
- [x] Considera using [replay_bloc](https://pub.dev/packages/replay_bloc) or [hydrated_bloc](https://pub.dev/packages/hydrated_bloc) to handle state conservation between navigation from search page to details
- [x] Monitor network connection to improve error handling
- [x] Implement env files management ([check this package](https://pub.dev/packages/envify))
  - [x] API URLs
  - [x] Flutter Downloader initialization (set debug to `false`)
- [ ] Translate push notification messages from flutter_downloader
- [ ] Transitions animations right now may seem standard (FadeTransiion), but there are still some minimal differences because most of them are driven by `showSearch()` and `showDialog()` functions
- [ ] Limit number of characters for search bar
- [ ] Consider moving `lib/domain/filters_extensions,dart` to `global` folder
- [ ] Organize hardcoded non-translatable strings (eg: `displayAPILabel` in `filters_extensions.dart`)
- [ ] Find a good solution for constant and impredictable IP changes in Library Genesis (see _/home/manuel/development/libgen_mobile_app/flutter_app/libgen/android/app/src/main/res/xml/network_security_config.xml_ and the [API repo](https://github.com/manuelvargastapia/libgen_api/tree/master) for better understanding)
- [ ] Unit testing
- [ ] Work with [cached images](https://flutter.dev/docs/cookbook/images/cached-images)
- [ ] Automated testing for Blocs ([check this package](https://pub.dev/packages/bloc_test))
- [ ] Find a better solution for permissions issues in Android 10: currently, a temporary solution has been implemented in `AndroidManifext.xml` (`android:requestLegacyExternalStorage="true"`). [Check this post](https://medium.com/@sriramaripirala/android-10-open-failed-eacces-permission-denied-da8b630a89df)
- [ ] Find a better solution for lint options issues associated to Gradle plugin ([see GitHub issue](https://github.com/flutter/flutter/issues/30598)). Currently, a temporary solution is being applied in `android/app/build.gradle` (`checkReleaseBuilds false)
- [ ] Update flutter_bloc package. See [migration guide](https://bloclibrary.dev/#/migration)
- [ ] Implement analytics or logging for better error tracking
- [ ] Control appropiately the error case when opening Hive box
- [ ] Implement lazy boxes in Hive for large data sets
  - [ ] Portentially large data set of suggestions
  - [ ] API data cached
- [ ] Solve Android 11 access issue [ver documentación](https://developer.android.com/about/versions/11/privacy/storage)
- [ ] Handle potential issues (run after `flutter clean`): `Note: Some input files use or override a deprecated API.`