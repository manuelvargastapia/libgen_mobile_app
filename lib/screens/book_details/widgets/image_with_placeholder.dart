import 'package:flutter/material.dart';

class ImageWidgetPlaceholder extends StatelessWidget {
  final ImageProvider image;
  final Widget placeholder;

  const ImageWidgetPlaceholder({this.image, this.placeholder});

  @override
  Widget build(BuildContext context) {
    if (image == null) return placeholder;
    return Image(
      image: image,
      errorBuilder: (context, error, stackTrace) => placeholder,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return _displayImageWithBackground(child);
        } else {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: frame != null
                ? _displayImageWithBackground(child)
                : placeholder,
          );
        }
      },
    );
  }

  Widget _displayImageWithBackground(Widget child) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.dstATop,
              ),
              image: image,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: child,
        )
      ],
    );
  }
}
