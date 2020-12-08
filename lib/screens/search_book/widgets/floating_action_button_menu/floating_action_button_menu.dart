import 'package:flutter/material.dart';
import 'package:libgen/screens/search_book/widgets/floating_action_button_menu/circular_button.dart';
import 'package:package_info/package_info.dart';

import 'package:libgen/blocs/theme_cubit.dart';
import 'package:libgen/generated/l10n.dart';

class FloatingActionButtonMenu extends StatefulWidget {
  final String appIconPath;
  final PackageInfo packageInfo;
  final ThemeCubit themeCubit;

  FloatingActionButtonMenu({
    @required this.appIconPath,
    @required this.packageInfo,
    @required this.themeCubit,
  });

  @override
  _FloatingActionButtonMenuState createState() =>
      _FloatingActionButtonMenuState();
}

class _FloatingActionButtonMenuState extends State<FloatingActionButtonMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _degOneTranslationAnimation, _degTwoTranslationAnimation;
  Animation _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 75),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 25),
    ]).animate(_animationController);
    _degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 55),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 45),
    ]).animate(_animationController);

    _rotationAnimation = Tween(
      begin: 180.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }

  double _getRadiansFromDregree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -90,
          right: 30,
          child: Stack(
            alignment: Alignment.center,
            children: [
              IgnorePointer(
                child: Container(
                  height: 300,
                  width: 60,
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(
                  _getRadiansFromDregree(270),
                  _degTwoTranslationAnimation.value * 125,
                ),
                child: Transform(
                  transform: Matrix4.rotationZ(
                    _getRadiansFromDregree(_rotationAnimation.value),
                  )..scale(_degTwoTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Theme.of(context).primaryColor,
                    height: 50,
                    width: 50,
                    icon: Icon(
                      Icons.brightness_4,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {
                      widget.themeCubit.toggleTheme();
                    },
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(
                  _getRadiansFromDregree(270),
                  _degOneTranslationAnimation.value * 65,
                ),
                child: Transform(
                  transform: Matrix4.rotationZ(
                    _getRadiansFromDregree(_rotationAnimation.value),
                  )..scale(_degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Theme.of(context).primaryColor,
                    height: 50,
                    width: 50,
                    icon: Icon(
                      Icons.info,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {
                      showAboutDialog(
                        context: context,
                        applicationIcon:
                            ImageIcon(AssetImage(widget.appIconPath)),
                        applicationName: widget.packageInfo.appName,
                        applicationLegalese:
                            S.of(context).searchBookScreenApplicationLegalese,
                        applicationVersion: widget.packageInfo.version,
                      );
                    },
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.rotationZ(
                  _getRadiansFromDregree(_rotationAnimation.value),
                ),
                alignment: Alignment.center,
                child: CircularButton(
                  color: Theme.of(context).buttonColor,
                  height: 60,
                  width: 60,
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    if (_animationController.isCompleted) {
                      _animationController.reverse();
                    } else {
                      _animationController.forward();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
