import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class SelectedProfileImage extends StatefulWidget {
  const SelectedProfileImage({super.key});

  @override
  State<SelectedProfileImage> createState() => _SelectedProfileImageState();
}

class _SelectedProfileImageState extends State<SelectedProfileImage> {
  String? imageName;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 16),
          child: Image(
              width: 96,
              height: 96,
              image: AssetImage("assets/profile_dog.png")),
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
        SelectedProfileImage()
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

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     /* 
//     뭔가 state를 바꾸는 코드가 안에들어감
//     state가 바뀌면 빌드 아래에 있는 메서드를 다시 호출하고 바뀐 값이 반영됨.
//     setState()함수 없이 값을 바꾸면 build 메서드가 다시 불리지 않기 때문에 아무 일도 벌어지지 않음.
//     */
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     /* 
//     setState()가 불릴때 마다 불림
//     플러터는 최적화 잘 해놨기 때문에, 위젯 인스턴스들의 값들을 일일이 바꾸려고 하지말고
//     값을 바꾸는 setState()함수를 잘 사용하삼.
//     */

//     return Scaffold(
//       // 앱의 뼈대를 이루는 위젯
//       appBar: AppBar(
//         /*
//         App.build method로 만들어진 MyHomePage object로부터 값을 받아 만듬.
//         */

//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center 위젯
//         // 하나의 자식을 가짐.
//         child: Column(
//           /*
//           Column도 layoutWidget
//           대신 Center와 다르게 리스트형태의 자식들을 가짐 + 수직 정렬함
//           기본적으로 자식들의 수평 사이즈를 맞추려고 하고, 부모의 높이를 맞추려고 함

//           column 은 사이즈 조절을 위해 다양한 프로퍼티를 가지고 있음.
//           밑은 maxAxisAlignment를 이용한 예시임.
//           수직정렬 + 중앙정렬            
//           */
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
