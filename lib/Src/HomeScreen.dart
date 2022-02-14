import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: <Widget>[
              _buildPage(
                title: 'home',
              ),
              _buildPage(
                title: 'Profile',
              ),
              _buildPage(
                title: 'Messages',
              ),
              _buildPage(
                title: 'Settings',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: false,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.blue),
          ],
        ));
  }

  _buildPage({String? title}) {
    if (title == 'home') {
      return Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.home, size: 200.0, color: Colors.white),
              Text(title!, style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Text('data'),
        color: Colors.black,
      );
    }
  }
}
