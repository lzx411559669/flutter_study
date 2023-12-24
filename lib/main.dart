import 'package:flutter/material.dart';
import 'package:namer_app/tab/focus.dart';
import 'package:namer_app/tab/home.dart';
import 'package:namer_app/tab/message.dart';
import 'package:namer_app/tab/my.dart';
import 'package:namer_app/tab/publish.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int int_currentIndex = 0;

  final List<Widget> _tabPages = const [
    HomePage(),
    FocusPage(),
    PublishPage(),
    MessagePage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tab Demo"),
      ),
      body: _tabPages[int_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: int_currentIndex,
        fixedColor: Colors.green,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "关注",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "发布"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的")
        ],
        onTap: (value) => setState(() => int_currentIndex = value),
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 6),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton(
            backgroundColor: int_currentIndex == 2 ? Colors.green : Colors.blue,
            // 当点击悬浮按钮的时候，选中发布页面
            onPressed: (() => setState(() => int_currentIndex = 2)),
            child: const Icon(Icons.add)),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // 设置悬浮按钮的位置
    );
  }
}
