import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          key: _key,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 40,
            ),
            Lottie.asset('assets/start.json',
                fit: BoxFit.fill, alignment: Alignment.center),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: Duration(milliseconds: 1000),
                    duration: Duration(milliseconds: 1000),
                    child: Text(
                      "Finding Good Develeper \nor Designer \nnow more easy",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 1200),
                    duration: Duration(milliseconds: 1000),
                    child: Text(
                      "or you want to prove your skill \neasily in the professional way?",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 16,
                          height: 1.8,
                          color: Color.fromARGB(255, 255, 219, 219)),
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              delay: Duration(milliseconds: 1300),
              duration: Duration(milliseconds: 1000),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/create');
                        },
                        color: Color.fromARGB(255, 201, 74, 74),
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                            EdgeInsets.only(left: 25, right: 25, bottom: 4),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 16, color: Colors.white),
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text(
                          "SKIP",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.8,
                              color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
