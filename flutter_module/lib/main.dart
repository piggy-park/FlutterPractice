import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/open_chat_profile_widgets.dart';

const channelName = "test_Channel/custom";
const methodChannel = MethodChannel(channelName);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 시뮬레이터에 디버그 표시 여부
      debugShowCheckedModeBanner: false,
      home: OpenChatProfilePage(),
    );
  }
}

class SelectableProfileImages extends StatefulWidget {
  const SelectableProfileImages({super.key});

  @override
  State<SelectableProfileImages> createState() =>
      _SelectableProfileImagesState();
}

class _SelectableProfileImagesState extends State<SelectableProfileImages> {
  final List<String> profileImageNames = [
    "assets/profile_dog-default.png",
    "assets/profile_setting-0.png",
    "assets/profile_setting-1.png",
    "assets/profile_setting-2.png",
    "assets/profile_setting-3.png",
    "assets/profile_setting-4.png",
    "assets/profile_setting-5.png",
    "assets/profile_setting-6.png",
    "assets/profile_setting-7.png",
    "assets/btn_uploadImage.png",
  ];

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Column(
          children: [
            // for (final name in profileImageNames) {
            Row(
              children: [
                SelectableProfileImage(
                  imageName: "assets/profile_dog-default.png",
                )
              ],
            )
          ],
        ));
  }
}

class SelectedProfileImage extends StatefulWidget {
  const SelectedProfileImage({super.key});

  @override
  State<SelectedProfileImage> createState() => _SelectedProfileImageState();
}

class _SelectedProfileImageState extends State<SelectedProfileImage> {
  String? imageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 16),
          child: Image(
              width: 96,
              height: 96,
              // todo: imageName에 따라서 이미지 바꾸기
              image: AssetImage("assets/profile_dog-default.png")),
        )
      ],
    );
  }
}

class OpenChatProfilePage extends StatelessWidget {
  // 위젯의 고유성과 업데이트 관리에 용이하기 때문에 부모의 key인 super.key를 주입함.
  const OpenChatProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        //header
        SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: OpenChatProfilePageHeader()),
        // SelectedProfile
        SelectedProfileImage(),
        SelectableProfileImages()
      ],
    ));
  }
}

class OpenChatProfilePageHeader extends StatelessWidget {
  const OpenChatProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            IconButton(
              padding: const EdgeInsets.only(left: 24),
              icon: const Image(
                  image: AssetImage(
                "assets/po_close_black.png",
              )),
              iconSize: 28,
              onPressed: () {
                print("add some dismiss Action!");
              },
            ),
            const Center(
                child: Text(
              "오픈채팅",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            )),
          ],
        ));
  }
}
