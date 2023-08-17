import 'package:flutter/material.dart';

class SelectableProfileImage extends StatefulWidget {
  final String imageName;

  const SelectableProfileImage({super.key, required this.imageName});

  @override
  State<SelectableProfileImage> createState() => _SelectableProfileImageState();
}

class _SelectableProfileImageState extends State<SelectableProfileImage> {
  bool isSelected = false;

  void onClicked() {
    setState(() {
      if (isSelected) {
        isSelected = false;
      } else {
        isSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      // 기본 딤처리 없애기.
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Card(
        shape: CircleBorder(
          side: BorderSide(
              width: isSelected ? 2 : 1,
              color: isSelected ? Colors.blue : Colors.transparent),
        ),
        elevation: 0,
        child: IconButton(
          onPressed: onClicked,
          padding: EdgeInsets.zero,
          iconSize: 52,
          icon: Image(
            image: AssetImage(widget.imageName),
          ),
        ),
      ),
    );
  }
}
