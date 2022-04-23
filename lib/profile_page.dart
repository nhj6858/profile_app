import 'package:flutter/material.dart';
import 'package:profile_app/avatar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _handleEmailTap() {
    _launchURI("mailto:kineo2k@gmail.com");
  }

  void _handleGithubTap() async {
    _launchURI("https://github.com/kineo2k");
  }

  void _handleBlogTap() {
    _launchURI("https://velog.io/@kineo2k");
  }

  void _launchURI(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.black87,
          child: Stack(
            children: [
              _createBackgroundImage(),
              _createContents(),
              _createAvatarImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createBackgroundImage() {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Image.asset(
        "assets/images/bg.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _createContents() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            _createTitle(),
            const Spacer(flex: 1),
            _createMessage(),
            const Spacer(flex: 1),
            const Divider(
              height: 1.5,
              color: Colors.white70,
              indent: 40,
              endIndent: 40,
            ),
            const SizedBox(height: 20.0),
            _createLinks(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _createAvatarImage() {
    return const Align(
      child: Avatar(),
    );
  }

  Widget _createTitle() {
    return const Text(
      "Hi! I'm Gump!",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
        fontFamily: "cursive",
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _createMessage() {
    return const Text(
      "I am a programmer!\nI like Go, JavaScript, and Flutter ❤️",
      style: TextStyle(
        color: Colors.white,
        fontSize: 13.0,
        fontFamily: "sans-serif-medium",
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _createLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _createButton(
          "assets/images/email.png",
          _handleEmailTap,
        ),
        _createButton(
          "assets/images/github.png",
          _handleGithubTap,
        ),
        _createButton(
          "assets/images/blog.png",
          _handleBlogTap,
        ),
      ],
    );
  }

  Widget _createButton(String imagePath, VoidCallback onPress) {
    return ClipOval(
      child: SizedBox(
        width: 80,
        height: 80,
        child: MaterialButton(
          onPressed: onPress,
          child: Image.asset(imagePath, width: 28),
        ),
      ),
    );
  }
}
