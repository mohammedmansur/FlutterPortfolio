import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portfolio/Src/Actor/Developer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:portfolio/Src/Data/ProfileInfo.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                const SizedBox(
                  height: 15,
                ),
                const Spacer(
                  flex: 3,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  leading: const Icon(Iconsax.home),
                  title: const Text('Back to Start'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/create');
                  },
                  leading: const Icon(Icons.new_label),
                  title: const Text('Create a new Profile'),
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
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('profile')
              .where('isApproved', isEqualTo: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return LinearProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            var docs = snapshot.data!.docs
                .map((e) =>
                    ProfileInfo.fromMap(e.data() as Map<String, dynamic>))
                .toList();
            return CarouselSlider.builder(
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileScreen(pro: docs[index]))),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 320,
                                margin: EdgeInsets.only(top: 10),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(docs[index].imgUrl!,
                                    fit: BoxFit.cover),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                docs[index].name!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                docs[index].title!,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: docs.length,
              carouselController: _carouselController,
              options: CarouselOptions(
                  height: 500,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            );
          },
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  CarouselController _carouselController = CarouselController();
  int _current = 0;
  dynamic _selectedIndex = {};
}
