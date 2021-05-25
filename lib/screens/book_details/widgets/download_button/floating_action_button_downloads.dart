import 'package:flutter/material.dart';
import 'package:libgen/domain/download_link_model.dart';

import 'package:libgen/screens/book_details/widgets/download_button/circular_button.dart';

class FloatingActionButtonDownloads extends StatefulWidget {
  final List<DownloadLinkModel> items;
  final Widget label;
  final Widget icon;
  final Color optionButtonsBackgroundColor;
  final Color mainButtonBackgroundColor;
  final Function(DownloadLinkModel item) onSelected;

  FloatingActionButtonDownloads({
    @required this.items,
    @required this.label,
    @required this.icon,
    @required this.optionButtonsBackgroundColor,
    @required this.mainButtonBackgroundColor,
    @required this.onSelected,
  });

  @override
  _FloatingActionButtonMenuState createState() =>
      _FloatingActionButtonMenuState();
}

class _FloatingActionButtonMenuState
    extends State<FloatingActionButtonDownloads>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _degOneTranslationAnimation,
      _degTwoTranslationAnimation,
      _degThreeTranslationAnimation,
      _degFourTranslationAnimation;
  Animation _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );

    _degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.1), weight: 75),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 25),
    ]).animate(_animationController);
    _degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 55),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 45),
    ]).animate(_animationController);
    _degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.3), weight: 45),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 55),
    ]).animate(_animationController);
    _degFourTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 75),
    ]).animate(_animationController);

    _rotationAnimation = Tween(
      begin: 0.0,
      end: 360.0,
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
          bottom: -270,
          right: 20,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              IgnorePointer(
                child: Container(
                  height: 600,
                  width: 60,
                ),
              ),
              ...[
                // Max length of button links: 4
                ...widget.items.asMap().entries.take(4).map(
                  (entry) {
                    double distance;
                    dynamic scale;

                    switch (entry.key) {
                      case 0:
                        distance = _degOneTranslationAnimation.value * 60;
                        scale = _degOneTranslationAnimation.value;
                        break;
                      case 1:
                        distance = _degTwoTranslationAnimation.value * 120;
                        scale = _degTwoTranslationAnimation.value;
                        break;
                      case 2:
                        distance = _degThreeTranslationAnimation.value * 180;
                        scale = _degThreeTranslationAnimation.value;
                        break;
                      case 3:
                        distance = _degFourTranslationAnimation.value * 240;
                        scale = _degFourTranslationAnimation.value;
                        break;
                      default:
                    }

                    return Transform.translate(
                      offset: Offset.fromDirection(
                        _getRadiansFromDregree(270),
                        distance,
                      ),
                      child: Row(
                        children: [
                          if (_animationController.isCompleted)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: widget.optionButtonsBackgroundColor,
                              ),
                              child: Text(
                                entry.value.label,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          Transform(
                            transform: Matrix4.rotationZ(
                              _getRadiansFromDregree(_rotationAnimation.value),
                            )..scale(scale),
                            alignment: Alignment.center,
                            child: CircularButton(
                              color: widget.optionButtonsBackgroundColor,
                              height: 50,
                              width: 50,
                              icon: widget.icon,
                              onPressed: () {
                                widget.onSelected(entry.value);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
              GestureDetector(
                onTap: () {
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: widget.mainButtonBackgroundColor,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          top: 16,
                          bottom: 16,
                        ),
                        child: widget.label,
                      ),
                      Transform(
                        transform: Matrix4.rotationZ(
                          _getRadiansFromDregree(_rotationAnimation.value),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: widget.icon,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
