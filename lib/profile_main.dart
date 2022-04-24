import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  bool _imageA = true;
  final Uri _urlSecond = Uri.parse('https://flutter.dev');
  final Uri _urlThird = Uri.parse('https://pub.dev/packages/url_launcher');
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'hyo@example.com',
      queryParameters: {
        'subject': 'Example Subject & Test'
      }
  );

  void _changeImage() {
    setState(() {
      _imageA = !_imageA;
    });
  }
  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    final image = _imageA ? "mokoko.png" : "lostark.jpeg";
    final double fullHeight = MediaQuery.of(context).size.height;
    final double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: fullHeight * 0.5,
                  width: fullWidth,
                  child: Image.asset("assets/chunsik.png", fit: BoxFit.cover),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 100, bottom: 20),
                  child: const Text(
                    "Hi, I'm Hyo",
                    style: TextStyle(
                      fontFamily: "WaterBrush",
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: fullWidth,
                  padding: const EdgeInsets.only(bottom: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white12,width: 2,
                      )
                    )
                  ),
                  child: const Text(
                    "I am a programmer\nI like Flutter",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => launch(_emailLaunchUri.toString()),
                        child: const Icon(Icons.email,color: Colors.white,size: 30),
                      ),
                      GestureDetector(
                        onTap: () => _launchUrl(_urlSecond),
                        child: const Icon(Icons.margin,color: Colors.white,size: 30),
                      ),
                      GestureDetector(
                        onTap: () => _launchUrl(_urlThird),
                        child: const Icon(Icons.account_balance_wallet,color: Colors.white,size: 30),
                      )
                    ],
                )
                )
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: _changeImage,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/$image"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
