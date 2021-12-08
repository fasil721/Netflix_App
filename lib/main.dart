import 'package:flutter/material.dart';
import 'package:netfix/pages/coming_soon_page.dart';
import 'package:netfix/pages/downloads.dart';
import 'package:netfix/pages/home_page.dart';

void main() async {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomePage(),
      const ComingSoonPage(),
      const Downloads(),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        selectedItemColor: Colors.white,
        backgroundColor: const Color(0xff121212),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) => setState(
          () {
            currentIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              currentIndex == 0
                  ? const AssetImage("assets/icons/home2.png")
                  : const AssetImage("assets/icons/home1.png"),
              size: 25,
            ),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.gamepad_sharp,
          //   ),
          //   label: "Games",
          // ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              currentIndex == 1
                  ? const AssetImage("assets/icons/video2.png")
                  : const AssetImage("assets/icons/video1.png"),
              size: 25,
            ),
            label: "Coming soon",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.sentiment_very_satisfied,
          //   ),
          //   label: "fast Laughs",
          // ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.file_download_outlined,
            ),
            label: "Downloads",
          ),
        ],
      ),
    );
  }
}
