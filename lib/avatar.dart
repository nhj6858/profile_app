import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  static const _imageSize = 150.0;

  int _imageIndex = 1;

  void _handleAvatarTap() {
    setState(() {
      _imageIndex = _imageIndex.isOdd ? 0 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleAvatarTap,
      child: ClipOval(
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: Colors.white70,
          width: _imageSize + 3,
          height: _imageSize + 3,
          alignment: Alignment.center,
          child: ClipOval(
            clipBehavior: Clip.antiAlias,
            child: _createImage(),
          ),
        ),
      ),
    );
  }

  Widget _createImage() {
    return SizedBox(
      width: _imageSize,
      height: _imageSize,
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        firstChild: Image.asset("assets/images/avatar1.jpg"),
        secondChild: Image.asset("assets/images/avatar2.jpg"),
        crossFadeState: _imageIndex.isOdd
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }
}
