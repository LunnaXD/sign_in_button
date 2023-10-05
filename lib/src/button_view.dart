import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_button/src/assets.dart';
import 'package:sign_in_button/src/button_builder.dart';
import 'package:sign_in_button/src/button_list.dart';
import 'package:sign_in_button/src/button_type.dart';

class SignInButton extends StatelessWidget {
  /// Here are the buttons builder which integrate with button builder
  /// and the buttons list.
  ///
  /// The `SignInButton` class already contains general used buttons.
  /// In case of other buttons, user can always use `SignInButtonBuilder`
  /// to build the sign in button.

  /// onPressed function should be passed in as a required field.
  final Function onPressed;

  /// button should be used from the enum class `Buttons`
  final SocialButton button;

  /// mini is a boolean field which specify whether to use a square mini button.
  final bool mini;

  /// Whether the button is enabled or disabled.
  final bool? enabled;

  /// overrides the default button text
  final String? text;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  final ButtonType? buttonType;

  final double? cornerRadiusButton;

  /// The constructor is fairly self-explanatory.
  const SignInButton(
    this.button, {
    Key? key,
    required this.onPressed,
    this.mini = false,
    this.enabled,
    this.text,
    this.clipBehavior = Clip.none,
    this.buttonType,
    this.cornerRadiusButton,
  })  : assert(
          mini != true ||
              !(button == SocialButton.google || button == SocialButton.facebookNew),
          'Google and FacebookNew buttons do not support mini mode',
        ),
        super(key: key);

  /// The build function is used to build the widget which will switch to
  /// desired widget based on the enum class `Buttons`
  @override
  Widget build(BuildContext context) {
    switch (button) {
      case SocialButton.google:
        return SignInButtonBuilder(
          key: const ValueKey('Google'),
          mini: mini,
          text: text ?? 'Sign in with Google',
          lightTextColor: const Color.fromRGBO(0, 0, 0, 0.9),
          darkTextColor: const Color(0xFFFFFFFF),
          imageLightTheme: Assets.logosGoogleLight,
          imageDarkTheme: Assets.logosGoogleDark,
          lightBackgroundColor: Colors.white,
          darkBackgroundColor: const Color(0xFF4285F4),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType ?? ButtonType.elevated,
          clipBehavior: clipBehavior,
        );
      case SocialButton.facebook:
      case SocialButton.facebookNew:
        return SignInButtonBuilder(
          key: const ValueKey('Facebook'),
          mini: mini,
          text: text ?? 'Sign in with Facebook',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.facebookF,
          imageLightTheme:
              button == SocialButton.facebookNew ? Assets.logosFacebookNew : null,
          imageSize: 24,
          lightBackgroundColor: button == SocialButton.facebookNew
              ? const Color(0xFF1877f2)
              : const Color(0xFF3B5998),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
          padding: button == SocialButton.facebookNew ? 8 : null,
        );
      case SocialButton.gitHub:
        return SignInButtonBuilder(
          key: const ValueKey('GitHub'),
          mini: mini,
          text: text ?? 'Sign in with GitHub',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.github,
          lightBackgroundColor: const Color(0xFF444444),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.apple:
        return SignInButtonBuilder(
          key: const ValueKey('Apple'),
          mini: mini,
          text: text ?? 'Sign in with Apple',
          lightTextColor: const Color.fromRGBO(0, 0, 0, 0.9),
          darkTextColor: Colors.white,
          icon: FontAwesomeIcons.apple,
          lightBackgroundColor: const Color(0xFFFFFFFF),
          darkBackgroundColor: const Color(0xFF000000),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType ?? ButtonType.elevated,
          clipBehavior: clipBehavior,
        );
      case SocialButton.linkedIn:
        return SignInButtonBuilder(
          key: const ValueKey('LinkedIn'),
          mini: mini,
          text: text ?? 'Sign in with LinkedIn',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.linkedinIn,
          lightBackgroundColor: const Color(0xFF007BB6),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.pinterest:
        return SignInButtonBuilder(
          key: const ValueKey('Pinterest'),
          mini: mini,
          text: text ?? 'Sign in with Pinterest',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.pinterest,
          lightBackgroundColor: const Color(0xFFCB2027),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.tumblr:
        return SignInButtonBuilder(
          key: const ValueKey('Tumblr'),
          mini: mini,
          text: text ?? 'Sign in with Tumblr',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.tumblr,
          lightBackgroundColor: const Color(0xFF34526f),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.twitter:
        return SignInButtonBuilder(
          key: const ValueKey('Twitter'),
          mini: mini,
          text: text ?? 'Sign in with Twitter',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.twitter,
          lightBackgroundColor: const Color(0xFF1DA1F2),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.reddit:
        return SignInButtonBuilder(
          key: const ValueKey('Reddit'),
          mini: mini,
          text: text ?? 'Sign in with Reddit',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.reddit,
          lightBackgroundColor: const Color(0xFFFF4500),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.quora:
        return SignInButtonBuilder(
          key: const ValueKey('Quora'),
          mini: mini,
          text: text ?? 'Sign in with Quora',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.quora,
          lightBackgroundColor: const Color(0xffa40a00),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.yahoo:
        return SignInButtonBuilder(
          key: const ValueKey('Yahoo'),
          mini: mini,
          text: text ?? 'Sign in with Yahoo',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.yahoo,
          lightBackgroundColor: const Color(0xff6001d2),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.hotmail:
        return SignInButtonBuilder(
          key: const ValueKey('Hotmail'),
          mini: mini,
          text: text ?? 'Sign in with Hotmail',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.commentSms,
          lightBackgroundColor: const Color(0xFF0072c6),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.xbox:
        return SignInButtonBuilder(
          key: const ValueKey('Xbox'),
          mini: mini,
          text: text ?? 'Sign in with Xbox',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.xbox,
          lightBackgroundColor: const Color(0xFF107c0f),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.microsoft:
        return SignInButtonBuilder(
          key: const ValueKey('Microsoft'),
          mini: mini,
          text: text ?? 'Sign in with Microsoft',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: FontAwesomeIcons.microsoft,
          lightBackgroundColor: const Color(0xff235A9F),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
      case SocialButton.anonymous:
        return SignInButtonBuilder(
          key: const ValueKey('Anonymous'),
          mini: mini,
          text: text ?? 'Anonymous',
          lightTextColor: const Color.fromRGBO(0, 0, 0, 0.9),
          icon: Icons.account_circle,
          lightBackgroundColor: const Color(0xFFFFFFFF),
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType ?? ButtonType.elevated,
          clipBehavior: clipBehavior,
        );
      case SocialButton.email:
      default:
        return SignInButtonBuilder(
          key: const ValueKey('Email'),
          mini: mini,
          text: text ?? 'Sign in with Email',
          lightTextColor: const Color(0xFFFFFFFF),
          icon: Icons.email,
          lightBackgroundColor: Colors.grey[700]!,
          onPressed: onPressed,
          enabled: enabled,
          radiusButton: cornerRadiusButton,
          buttonType: buttonType,
          clipBehavior: clipBehavior,
        );
    }
  }
}
