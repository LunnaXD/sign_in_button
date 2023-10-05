import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// This is an example app which make use of
  /// `SignInButtonBuilder` and `SignInButton` class
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light, //ThemeMode.dark,
      home: const Scaffold(
        body: SignInPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  /// Show a simple "___ Button Pressed" indicator
  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$provider Button Pressed!'),
        duration: const Duration(milliseconds: 400),
      ),
    );
  }

  /// Normally the signin buttons should be contained in the SignInPage
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButtonBuilder(
                text: 'Get going with Email',
                lightTextColor: const Color(0xFFFFFFFF),
                icon: Icons.email,
                onPressed: () {
                  _showButtonPressDialog(context, 'Email');
                },
                lightBackgroundColor: Colors.blueGrey[700]!,
                width: 200.0,
              ),
              SignInButtonBuilder(
                text: 'Get going with Email',
                lightTextColor: const Color(0xFFFFFFFF),
                icon: Icons.email,
                radiusButton: 4,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Email');
                },
                lightBackgroundColor: Colors.blueGrey[700]!,
                width: 200.0,
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                SocialButton.google,
                onPressed: () {
                  _showButtonPressDialog(context, 'Google');
                },
              ),
              SignInButton(
                SocialButton.google,
                cornerRadiusButton: 4,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Google');
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                SocialButton.facebookNew,
                onPressed: () {
                  _showButtonPressDialog(context, 'FacebookNew');
                },
              ),
              SignInButton(
                SocialButton.facebookNew,
                cornerRadiusButton: 4,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'FacebookNew');
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                SocialButton.apple,
                onPressed: () {
                  _showButtonPressDialog(context, 'Apple');
                },
              ),
              SignInButton(
                SocialButton.apple,
                cornerRadiusButton: 4,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Apple');
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                SocialButton.gitHub,
                text: 'Sign up with GitHub',
                onPressed: () {
                  _showButtonPressDialog(context, 'Github');
                },
              ),
              SignInButton(
                SocialButton.gitHub,
                text: 'Sign up with GitHub',
                cornerRadiusButton: 4,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Github');
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                SocialButton.pinterest,
                onPressed: () {
                  _showButtonPressDialog(context, 'Github');
                },
              ),
              SignInButton(
                SocialButton.pinterest,
                cornerRadiusButton: 4,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Github');
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                SocialButton.microsoft,
                text: 'Sign up with Microsoft ',
                onPressed: () {
                  _showButtonPressDialog(context, 'Microsoft ');
                },
              ),
              SignInButton(
                SocialButton.microsoft,
                text: 'Sign up with Microsoft ',
                cornerRadiusButton: 4,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Microsoft ');
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                SocialButton.twitter,
                text: 'Use Twitter',
                onPressed: () {
                  _showButtonPressDialog(context, 'Twitter');
                },
              ),
              SignInButton(
                SocialButton.twitter,
                text: 'Use Twitter',
                cornerRadiusButton: 4,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Twitter');
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                SocialButton.linkedIn,
                mini: true,
                onPressed: () {
                  _showButtonPressDialog(context, 'LinkedIn (mini)');
                },
              ),
              SignInButton(
                SocialButton.tumblr,
                mini: true,
                cornerRadiusButton: 4,
                onPressed: () {
                  _showButtonPressDialog(context, 'Tumblr (mini)');
                },
              ),
              SignInButton(
                SocialButton.facebook,
                mini: true,
                onPressed: () {
                  _showButtonPressDialog(context, 'Facebook (mini)');
                },
              ),
              SignInButtonBuilder(
                icon: Icons.email,
                text: 'Ignored for mini button',
                lightTextColor: const Color(0xFFFFFFFF),
                mini: true,
                onPressed: () {
                  _showButtonPressDialog(context, 'Email (mini)');
                },
                lightBackgroundColor: Colors.cyan,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                SocialButton.linkedIn,
                mini: true,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'LinkedIn (mini)');
                },
              ),
              SignInButton(
                SocialButton.tumblr,
                mini: true,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Tumblr (mini)');
                },
              ),
              SignInButton(
                SocialButton.facebook,
                mini: true,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Facebook (mini)');
                },
              ),
              SignInButtonBuilder(
                icon: Icons.email,
                text: 'Ignored for mini button',
                lightTextColor: const Color(0xFFFFFFFF),
                mini: true,
                enabled: false,
                onPressed: () {
                  _showButtonPressDialog(context, 'Email (mini)');
                },
                lightBackgroundColor: Colors.cyan,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
