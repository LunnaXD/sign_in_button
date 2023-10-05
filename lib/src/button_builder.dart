import 'package:flutter/material.dart';
import 'package:sign_in_button/src/button_type.dart';

import 'package:sign_in_button/src/dimens.dart';

@immutable
class SignInButtonBuilder extends StatelessWidget {
  /// This is a builder class for signin button
  ///

  /// `mini` tag is used to switch from a full-width signin button to
  final bool mini;

  /// the button's text
  final String text;

  final Color? lightTextColor;
  final Color? darkTextColor;

  /// NOTE: Both [image] and [icon] can be added
  /// but [image] will take preference over [icon]
  final IconData? icon;
  final String? imageLightTheme;
  final String? imageDarkTheme;

  final double imageSize;

  /// backgroundColor
  final Color lightBackgroundColor;
  final Color darkBackgroundColor;

  /// onPressed should be specified as a required field to indicate the callback.
  final Function onPressed;

  /// To enable a button, set its value to "true".
  /// To disable a button, set its value to "false".
  ///
  /// This property is true by default.
  final bool enabled;

  /// corner radius of button
  final double radiusButton;

  /// button type: elevated, filled, outlined
  final ButtonType buttonType;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// padding is default to `EdgeInsets.all(4.0)`
  final double padding;

  /// width is default is 172px
  final double? width;

  const SignInButtonBuilder({
    Key? key,
    this.mini = false,
    required this.text,
    this.lightTextColor,
    this.darkTextColor,
    this.icon,
    this.imageLightTheme,
    this.imageDarkTheme,
    double? imageSize,
    required this.lightBackgroundColor,
    Color? darkBackgroundColor,
    required this.onPressed,
    bool? enabled,
    double? radiusButton,
    this.clipBehavior = Clip.none,
    double? padding,
    this.width,
    ButtonType? buttonType,
  })  : enabled = enabled ?? true,
        imageSize = imageSize ?? Dimens.imageSize,
        buttonType = buttonType ?? ButtonType.filled,
        radiusButton = radiusButton ?? Dimens.cornerRadiusButton,
        darkBackgroundColor = darkBackgroundColor ?? lightBackgroundColor,
        padding = padding ?? Dimens.paddingButton,
        assert(
        imageLightTheme != null || imageDarkTheme != null || icon != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightTheme = theme.brightness == Brightness.light;

    switch (buttonType) {
      case ButtonType.filled:
        return FilledButton.tonal(
          key: key,
          onPressed: enabled ? onPressed as void Function()? : null,
          clipBehavior: clipBehavior,
          style: FilledButton.styleFrom(
            minimumSize: _minimumSize(),
            shape: _buttonShape(),
            padding: _buttonPadding(),
            backgroundColor: _buttonBackgroundColor(isLightTheme),
          ),
          child: _contentButton(theme),
        );
      case ButtonType.elevated:
        return ElevatedButton(
          key: key,
          onPressed: enabled ? onPressed as void Function()? : null,
          clipBehavior: clipBehavior,
          style: ElevatedButton.styleFrom(
            minimumSize: _minimumSize(),
            shape: _buttonShape(),
            padding: _buttonPadding(),
            backgroundColor: _buttonBackgroundColor(isLightTheme),
          ),
          child: _contentButton(theme),
        );
      case ButtonType.outlined:
        return OutlinedButton(
          key: key,
          onPressed: enabled ? onPressed as void Function()? : null,
          clipBehavior: clipBehavior,
          style: ElevatedButton.styleFrom(
            minimumSize: _minimumSize(),
            shape: _buttonShape(),
            padding: _buttonPadding(),
            backgroundColor: _buttonBackgroundColor(isLightTheme),
          ),
          child: _contentButton(theme),
        );
    }
  }

  Size _minimumSize() => const Size(Dimens.minimumHeight, Dimens.minimumHeight);

  /// get container of button (image/icon + label)
  Widget _contentIconButton(ThemeData theme) {
    final isLightTheme = theme.brightness == Brightness.light;

    return SizedBox(
      width: Dimens.minimumHeight,
      height: Dimens.minimumHeight,
      child: _getIconOrImage(isLightTheme),
    );
  }

  /// get container of button (image/icon + label)
  Widget _contentButton(ThemeData theme) {
    final isLightTheme = theme.brightness == Brightness.light;

    if (mini) {
      return _contentIconButton(theme);
    }

    return SizedBox(
      width: mini ? null : (width ?? Dimens.buttonMinWidth),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getIconOrImage(isLightTheme),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.innerPaddingButton),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: enabled
                      ? theme.textTheme.labelLarge?.copyWith(
                    color: _colorTextAndIcon(isLightTheme),
                  )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color? _colorTextAndIcon(bool isLightTheme) =>
      isLightTheme ? lightTextColor : darkTextColor ?? lightTextColor;

  /// get shape
  RoundedRectangleBorder _buttonShape() => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radiusButton),
  );

  /// get background color
  Color _buttonBackgroundColor(bool isLightTheme) =>
      isLightTheme ? lightBackgroundColor : darkBackgroundColor;

  /// get padding
  EdgeInsets _buttonPadding() => EdgeInsets.all(padding);

  /// Get the icon or image widget
  Widget _getIconOrImage(bool isLightTheme) {
    final image = _getImage(isLightTheme);
    if (image != null) {
      final imageWidget = Image(
        image: image,
        height: imageSize,
      );

      return ClipRRect(
        borderRadius: BorderRadius.circular(radiusButton),
        child: imageWidget,
      );
    }

    final iconWidget = Icon(
      icon,
      size: Dimens.iconSize,
      // color: Colors.white,
      color: enabled ? _colorTextAndIcon(isLightTheme) : null,
    );

    if (mini) {
      return iconWidget;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Dimens.innerPaddingButton + 2,
        Dimens.innerPaddingButton + 2,
        0,
        Dimens.innerPaddingButton + 2,
      ),
      child: iconWidget,
    );
  }

  /// get image light o dark
  AssetImage? _getImage(bool isLightTheme) {
    if (imageLightTheme == null && imageDarkTheme == null) {
      return null;
    }

    late String image;
    if (isLightTheme) {
      image = imageLightTheme ?? imageDarkTheme!;
    } else {
      image = imageDarkTheme ?? imageLightTheme!;
    }

    return AssetImage(image, package: 'sign_in_button');
  }
}
