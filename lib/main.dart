import 'package:facebook/fbfeed.dart';
import 'package:facebook/friends_page.dart';
import 'package:facebook/group_page.dart';
import 'package:facebook/menu_page.dart';
import 'package:facebook/model/story.dart';
import 'package:facebook/notifications.dart';
import 'package:facebook/profile_page.dart';
import 'package:facebook/story_Slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

var _currentTab = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _icons = [
    Icons.home,
    Icons.people_outline,
    FontAwesomeIcons.users,
    FontAwesomeIcons.userCircle,
    FontAwesomeIcons.bell,
    Icons.menu
  ];

  Widget _iconsBar(index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            _currentTab = index;
          });
        },
        child: Column(
          children: <Widget>[
            Icon(
              _icons[index],
              size: 35,
              color: _currentTab == index ? Colors.blue : Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }

  Widget _underLine(i) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: _currentTab == i ? 3 : 0.5,
      width: 68,
      color: _currentTab == i ? Colors.blue : Colors.grey[400],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _currentTab == 0
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(top: 25),
                        child: Text(
                          'Facebook',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: Icon(
                                FontAwesomeIcons.search,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: Icon(
                                FontAwesomeIcons.facebookMessenger,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Text(''),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => _iconsBar(map.key))
                .toList(),
          ),
          Row(
            children: _icons
                .asMap()
                .entries
                .map((MapEntry map) => _underLine(map.key))
                .toList(),
          ),
          _currentTab == 0
              ? Scrolling()
              : _currentTab == 1
                  ? FriendPage()
                  : _currentTab == 2
                      ? GroupPage()
                      : _currentTab == 3
                          ? ProfilePage()
                          : _currentTab == 4 ? NotificationPage() : MenuPage(),
        ],
      ),
    );
  }
}

class Scrolling extends StatefulWidget {
  @override
  _ScrollingState createState() => _ScrollingState();
}

class _ScrollingState extends State<Scrolling> {
  List _icons2 = [
    {'icon': FontAwesomeIcons.video, 'name': 'Live', 'color': Colors.red},
    {'icon': FontAwesomeIcons.images, 'name': 'Photo', 'color': Colors.green},
    {
      'icon': FontAwesomeIcons.mapMarkerAlt,
      'name': 'Check In',
      'color': Colors.pink
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 519,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  child: GestureDetector(
                onTap: () {
                  ProfilePage();
                  print('Clicked');
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/profile/profile20.jpeg'),
                ),
              )),
              InkWell(
                onTap: () {},
                splashColor: Colors.white,
                child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 291,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text("What's on your mind ?")),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey[400],
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons2
                .asMap()
                .entries
                .map((MapEntry map) => Container(
                      child: Container(
                        padding: EdgeInsets.only(left: 30),
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1,
                                  color: map.key == 2
                                      ? Colors.white
                                      : Colors.grey[400])),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              _icons2[map.key]['icon'],
                              color: _icons2[map.key]['color'],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(_icons2[map.key]['name']),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          )),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 10,
            width: double.infinity,
            color: Colors.grey[400],
          ),
          StorySlider(),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 10,
            width: double.infinity,
            color: Colors.grey[400],
          ),
          News_Feed(),
        ],
      ),
    );
  }
}
