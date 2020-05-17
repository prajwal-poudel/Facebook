class NewsFeed {
  String profileUrl;
  String name;
  String time;
  String status;
  String feedUrl;

  NewsFeed({this.feedUrl, this.name, this.profileUrl, this.status, this.time});
}

List feeds = [
  NewsFeed(
      profileUrl: 'assets/images/profile/profile11.jpeg',
      name: 'Austin	Dickens',
      time: '1 hr',
      status: 'The application may be doing too much work on its main thread.',
      feedUrl: 'assets/images/feed/feed1.jpeg'),
  NewsFeed(
      profileUrl: 'assets/images/profile/profile12.jpeg',
      name: 'Wendy	Hamilton',
      time: '2 days',
      status: 'The application may be doing too much work on its main thread.',
      feedUrl: 'assets/images/feed/feed2.jpeg'),
  NewsFeed(
      profileUrl: 'assets/images/profile/profile13.jpeg',
      name: 'Ryan	Lawrence',
      time: '1 sec',
      status: 'The application may be doing too much work on its main thread.',
      feedUrl: 'assets/images/feed/feed3.jpeg'),
  NewsFeed(
      profileUrl: 'assets/images/profile/profile14.jpeg',
      name: 'Paul	Poole',
      time: '3 min',
      status: 'The application may be doing too much work on its main thread.',
      feedUrl: 'assets/images/feed/feed4.jpeg'),
  NewsFeed(
      profileUrl: 'assets/images/profile/profile15.jpeg',
      name: 'Julian	Rampling',
      time: '3 hr',
      status: 'The application may be doing too much work on its main thread.',
      feedUrl: 'assets/images/feed/feed5.jpeg'),
];
