import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portfolio/Src/Actor/Developer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.grey.shade800,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: const Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100.0,
                    height: 100.0,
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 24.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                        'https://th.bing.com/th/id/R.ba4b27129087764e5459ae2b71b7e657?rik=Y5GW4yGvwkOfGg&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_170969.png&ehk=kkFFbPn21rKlMeug0JX%2bOF%2bz03nECmwg6jepbGR0e3Q%3d&risl=&pid=ImgRaw&r=0')),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text(
                    // Provider.of<AuthService>(context, listen: true).theUser !=
                    //         null
                    //     ? Provider.of<AuthService>(context, listen: true)
                    //         .theUser!
                    //         .email!:
                    'no user',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                Divider(
                  thickness: 2,
                  indent: 20,
                  height: 3,
                  endIndent: 2,
                  color: Colors.white54,
                ),
                const Spacer(
                  flex: 3,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/ProfileScreen');
                  },
                  leading: const Icon(Iconsax.home),
                  title: const Text('Dashboard'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/verfication');
                  },
                  leading: const Icon(Iconsax.chart_2),
                  title: const Text('Analytics'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/verficationNumber');
                  },
                  leading: const Icon(Iconsax.profile_2user),
                  title: const Text('Contacts'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/v');
                  },
                  leading: const Icon(Iconsax.setting_2),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/r');
                  },
                  leading: const Icon(Iconsax.support),
                  title: const Text('Support'),
                ),
                Spacer(
                  flex: 5,
                ),
                Divider(
                  thickness: 2,
                  indent: 20,
                  height: 3,
                  endIndent: 2,
                  color: Colors.white54,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/SignUp');
                  },
                  leading: const Icon(Iconsax.login_14),
                  title: const Text('Sign Up'),
                ),
                // Provider.of<AuthService>(context, listen: true).theUser != null?
                ListTile(
                  onTap: () {
                    // Provider.of<AuthService>(context, listen: false)
                    //     .logOut();
                  },
                  leading: const Icon(Iconsax.logout),
                  title: const Text('SignOut'),
                ),
                // : ListTile(
                //     onTap: () {
                //       Navigator.pushNamed(context, '/Login');
                //     },
                //     leading: const Icon(Iconsax.login),
                //     title: const Text('Sign In'),
                //   ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: _handleMenuButtonPressed, icon: Icon(Icons.person)),
          ),
          body: ListView(
            children: [ProductCard(), ProductCard(), ProductCard()],
          )),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
