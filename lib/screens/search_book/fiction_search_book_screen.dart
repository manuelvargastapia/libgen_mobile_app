import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/blocs/theme_cubit.dart';
import 'package:libgen/domain/suggestion.dart';
import 'package:libgen/generated/l10n.dart';
import 'package:libgen/screens/search_book/sci_tech_search_book_screen.dart';
import 'package:libgen/screens/search_book/widgets/book_list/fiction_book_search_delegate.dart';
import 'package:libgen/screens/search_book/widgets/floating_action_button_menu/floating_action_button_menu.dart';
import 'package:package_info/package_info.dart';

class FictionSearchBookScreen extends StatelessWidget {
  static const String _lightLogoPath = "assets/images/logo_light.png";
  static const String _darkLogoPath = "assets/images/logo_dark.png";
  static const String _appIconPath = "assets/images/app_icon.png";

  /// Rebuilds [FloatingActionButtonMenu] anytime `showSearch` is called to reset FAB menu animation.
  final ValueNotifier<bool> _openingShowSearch = ValueNotifier(false);

  final PackageInfo packageInfo;

  FictionSearchBookScreen(this.packageInfo);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
    ));

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: Theme.of(context).brightness == Brightness.light
                    ? AssetImage(_lightLogoPath)
                    : AssetImage(_darkLogoPath),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Fiction", // TODO: translate
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Theme.of(context).buttonColor,
                      ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).searchBookScreenSearchBarHint,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Icon(
                              Icons.search,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onTap: () {
                        _openingShowSearch.value = true;
                        showSearch(
                          context: context,
                          delegate: FictionBookSearchDelegate(
                            context: context,
                            bookBloc: BlocProvider.of<BookBloc>(context),
                            hiveBloc: BlocProvider.of<HiveBloc<Suggestion>>(
                              context,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: 180 * Math.pi / 180,
                        child: Icon(
                          Icons.arrow_right_alt_outlined,
                          size: 50,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        'SciTech', // TODO: translate
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SciTechSearchBookScreen(packageInfo),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ValueListenableBuilder(
          valueListenable: _openingShowSearch,
          builder: (_, __, ___) {
            final bool animationMustBeReset = _openingShowSearch.value;
            _openingShowSearch.value = false;
            return FloatingActionButtonMenu(
              appIconPath: _appIconPath,
              packageInfo: packageInfo,
              themeCubit: BlocProvider.of<ThemeCubit>(context),
              animationMustBeReset: animationMustBeReset,
            );
          },
        ),
      ),
    );
  }
}
