import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_type.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final TextStyle _textStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: [
          CurvedNavigationBarItem(
              child: const Icon(Icons.home_outlined),
              label: 'Home',
              labelStyle: _textStyle),
          CurvedNavigationBarItem(
              child: const Icon(Icons.chat_bubble_outline),
              label: 'Oferts',
              labelStyle: _textStyle),
          CurvedNavigationBarItem(
            child: const Icon(Icons.newspaper),
            label: 'Profile',
            labelStyle: _textStyle,
          ),
          CurvedNavigationBarItem(
            child: const Icon(Icons.perm_identity),
            label: 'Cart',
            labelStyle: _textStyle,
          ),
        ],
        selectedIconColor: Colors.white,
        unselectedIconColor: Colors.white,
        type: CurvedNavigationBarType.outwards,
        color: Colors.black,
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueAccent,
          height: 1200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_page.toString(),
                    textScaler: const TextScaler.linear(10.0)),
                ElevatedButton(
                  child: const Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
