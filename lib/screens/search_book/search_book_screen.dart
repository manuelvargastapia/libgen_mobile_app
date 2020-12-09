import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/blocs/theme_cubit.dart';
import 'package:libgen/domain/suggestion.dart';
import 'package:libgen/generated/l10n.dart';
import 'package:libgen/screens/search_book/widgets/floating_action_button_menu/floating_action_button_menu.dart';
import 'package:package_info/package_info.dart';
import 'widgets/book_list/book_search_delegate.dart';

class SearchBookScreen extends StatelessWidget {
  static const String _lightLogoPath = "assets/images/logo_light.png";
  static const String _darkLogoPath = "assets/images/logo_dark.png";
  static const String _appIconPath = "assets/images/app_icon.png";

  final PackageInfo packageInfo;

  SearchBookScreen(this.packageInfo);

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
                        showSearch(
                          context: context,
                          delegate: BookSearchDelegate(
                            context: context,
                            bookBloc: BlocProvider.of<BookBloc>(context),
                            hiveBloc: BlocProvider.of<HiveBloc<Suggestion>>(
                              context,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButtonMenu(
          appIconPath: _appIconPath,
          packageInfo: packageInfo,
          themeCubit: BlocProvider.of<ThemeCubit>(context),
        ),
      ),
    );
  }
}
