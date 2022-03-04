import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Src/Data/ProfileInfo.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.pro}) : super(key: key);
  final ProfileInfo pro;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.pro.imgUrl!),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3)
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              widget.pro.name!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                const Text(
                                  "60 Project",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  widget.pro.isLookingForAJob == true
                                      ? 'Looking For A job'
                                      : 'in Work',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.pro.bio!,
                          style:
                              const TextStyle(color: Colors.grey, height: 1.4),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Born",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.pro.birthDate!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "City",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.pro.location!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Social Link",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 80,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              widget.pro.linkedIn != null
                                  ? _urlLauncherButton(
                                      url: widget.pro.linkedIn!,
                                      icon:
                                          const Icon(FontAwesomeIcons.linkedin))
                                  : Container(),
                              widget.pro.github != null
                                  ? _urlLauncherButton(
                                      url: widget.pro.github!,
                                      icon: const Icon(FontAwesomeIcons.github))
                                  : Container(),
                              widget.pro.stackOverflow != null
                                  ? _urlLauncherButton(
                                      url: widget.pro.stackOverflow!,
                                      icon: const Icon(
                                          FontAwesomeIcons.stackOverflow))
                                  : Container(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _urlLauncherButton({
    required String url,
    required Icon icon,
  }) {
    return IconButton(
      onPressed: () async {
        await canLaunch(url) == true
            ? launch(url)
            : debugPrint('can not launch');
      },
      icon: icon,
      color: Colors.white,
      iconSize: 32,
    );
  }
}
