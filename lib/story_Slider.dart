import 'package:facebook/model/story.dart';
import 'package:flutter/material.dart';

class StorySlider extends StatefulWidget {
  String name;
  String storyUrl;
  String profileUrl;
  int i;
  StorySlider({this.name, this.profileUrl, this.storyUrl, this.i});

  @override
  _StorySliderState createState() => _StorySliderState();
}

class _StorySliderState extends State<StorySlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: stories.length,
          itemBuilder: (BuildContext context, index) {
            Story story = stories[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      story.storyUrl,
                      fit: BoxFit.cover,
                      height: 250,
                      width: 150,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 60),

                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        // padding:
                        //     EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(story.profileUrl),
                          radius: 25,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          story.name,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
