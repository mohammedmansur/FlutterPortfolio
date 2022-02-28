import 'dart:io';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _key = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedProfileImg;
  // final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String? _theDlUrl;
  bool _isLoading = false;
  String? scanResult;

  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        selectedIndex: _selectedIndex,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;

          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text('Personal'),
            activeColor: Color.fromARGB(255, 243, 128, 33),
          ),
          BottomNavyBarItem(
              icon: Icon(
                Icons.category,
                color: Colors.white,
              ),
              title: Text('Skill'),
              activeColor: Color.fromARGB(255, 243, 128, 33)),
          BottomNavyBarItem(
            icon: Icon(
              Icons.link,
              color: Colors.white,
            ),
            title: Text('Soicial'),
            activeColor: Color.fromARGB(255, 243, 128, 33),
          ),
        ],
      ),
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
              title: 'personal',
            ),
            _buildPage(
              title: 'skill',
            ),
            _buildPage(
              title: 'social',
            ),
          ],
        ),
      ),
    );
  }

  DateTime? _birthDate;
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _birthDate = value!;
      });
    });
  }

  _buildPage({String? title}) {
    if (title == 'personal') {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            key: _key,
            children: [
              const SizedBox(
                height: 20,
              ),
              Lottie.asset('assets/reg.json',
                  fit: BoxFit.cover, alignment: Alignment.center),
              const SizedBox(
                height: 40,
              ),
              Form(
                  child: Column(
                children: [
                  TextField(
                    controller: _fullNameController,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Color.fromARGB(255, 255, 255, 255),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Full Name',
                      hintText: 'Name',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Iconsax.user,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Email',
                      hintText: 'Gmail&Yahoo&Hotmail....',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _locationController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Location',
                      hintText: 'City',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _phoneController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Phone Number',
                      hintText: '+964',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            onPressed: _showDatePicker,
                            icon: const Icon(
                              Icons.date_range,
                              size: 30,
                              color: Colors.white,
                            )),
                        _birthDate == null
                            ? Container()
                            : TextButton(
                                onPressed: () {
                                  setState(() {
                                    _birthDate = null;
                                  });
                                },
                                child: Text('Clear Date',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white))),
                        Center(
                            child: Text(
                          _birthDate == null
                              ? 'Click to The Icon Pick Your Birth date'
                              : 'BirthDay:  ' +
                                  _birthDate!.year.toString() +
                                  '/' +
                                  _birthDate!.month.toString() +
                                  '/' +
                                  _birthDate!.day.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _pageController.animateToPage(1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    height: 45,
                    color: Color.fromARGB(255, 243, 128, 33),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      );
    } else if (title == 'skill') {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            key: _key,
            children: [
              Lottie.asset('assets/start.json',
                  fit: BoxFit.contain, alignment: Alignment.center),
              const SizedBox(
                height: 40,
              ),
              Form(
                  child: Column(
                children: [
                  TextField(
                    controller: _fullNameController,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Color.fromARGB(255, 255, 255, 255),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Category',
                      hintText: 'Which type of job you Work in?',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Iconsax.category,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _fullNameController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Bio',
                      hintText: 'Briefly talk about your self',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.people_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          _pageController.animateToPage(0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        height: 45,
                        color: Color.fromARGB(255, 243, 128, 33),
                        child: const Text(
                          "Prev",
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          _pageController.animateToPage(2,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        height: 45,
                        color: Color.fromARGB(255, 243, 128, 33),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            key: _key,
            children: [
              SizedBox(
                height: 50,
              ),
              _selectedProfileImg == null
                  ? Container(
                      child: IconButton(
                          onPressed: () async {
                            // add image picker package
                            _selectedProfileImg = await _imagePicker.pickImage(
                                source: ImageSource.gallery);

                            debugPrint(
                                "===========>>>" + _selectedProfileImg!.path);
                            setState(() {});
                            // pick an image from the gallery
                          },
                          icon: Icon(
                            FontAwesomeIcons.map,
                            size: 80,
                          )),
                      height: 175,
                      width: 175,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        shape: BoxShape.circle,
                      ),
                    )
                  : Container(
                      height: 175,
                      width: 175,
                      decoration: BoxDecoration(
                        color:
                            _selectedProfileImg == null ? Colors.black : null,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: FileImage(
                            File(_selectedProfileImg!.path),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Form(
                  child: Column(
                children: [
                  TextField(
                    controller: _fullNameController,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Color.fromARGB(255, 255, 255, 255),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Category',
                      hintText: 'Which type of job you Work in?',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Iconsax.category,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _fullNameController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Bio',
                      hintText: 'Briefly talk about your self',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.people_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          _pageController.animateToPage(1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        height: 45,
                        color: Color.fromARGB(255, 243, 128, 33),
                        child: const Text(
                          "Prev",
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          _pageController.animateToPage(2,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        height: 45,
                        color: Color.fromARGB(255, 243, 128, 33),
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      );
    }
  }
}
