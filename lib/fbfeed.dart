import 'package:facebook/model/news_feed.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class News_Feed extends StatefulWidget {
  @override
  _News_FeedState createState() => _News_FeedState();
}

class _News_FeedState extends State<News_Feed> {
  List _icon = [
    {'icon': FontAwesomeIcons.thumbsUp, 'name': 'Like'},
    {'icon': FontAwesomeIcons.comment, 'name': 'Comment'},
    {'icon': FontAwesomeIcons.share, 'name': 'Share'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: feeds.asMap().entries.map((MapEntry map) {
      NewsFeed feed = feeds[map.key];
      return Container(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(feed.profileUrl),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              feed.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Container(
                              width: 120,
                              alignment: Alignment.bottomLeft,
                              child: Text(feed.time)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: FaIcon(FontAwesomeIcons.ellipsisH),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(feed.status),
          ),
          Container(
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              child: Image.asset(
                feed.feedUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          Container(
            height: 40,
            child: Text(''),
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey[400]),
                bottom: BorderSide(width: 1, color: Colors.grey[400]),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _icon.asMap().entries.map((MapEntry map) {
                return Container(
                  width: 120,
                  alignment: Alignment.center,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: FaIcon(
                            _icon[map.key]['icon'],
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(_icon[map.key]['name']),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 10,
            width: double.infinity,
            color: Colors.grey[400],
          ),
        ],
      ));
    }).toList());
  }
}
