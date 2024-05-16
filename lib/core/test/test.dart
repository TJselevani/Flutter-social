class User {
  String uid;
  String firstName;
  String lastName;
  String username;
  String email;
  Password password;
  String profilePic;

  List<Video>? videos;
  List<Like>? likes;
  List<Comment>? comments;

  User({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.profilePic,
    this.videos,
    this.likes,
    this.comments,
  });
}

class Video {
  String id;
  String title;
  String url;
  String location;
  String category;
  String timestamps;

  User user;
  List<Like>? likes;
  List<View>? views;
  List<Dislike>? dislikes;
  List<Comment>? comments;

  Video({
    required this.id,
    required this.title,
    required this.url,
    required this.location,
    required this.category,
    required this.timestamps,
    required this.user,
    this.likes,
    this.views,
    this.dislikes,
    this.comments,
  });
}

class Comment {
  String id;
  Video video;
  User user;

  Comment({
    required this.id,
    required this.video,
    required this.user,
  });
}

class Like {
  String id;
  User user;
  Video video;
  Comment comment;

  Like({
    required this.id,
    required this.user,
    required this.video,
    required this.comment,
  });
}

class Dislike {
  String id;
  User user;
  Video video;
  Comment comment;

  Dislike({
    required this.id,
    required this.user,
    required this.video,
    required this.comment,
  });
}

class View {
  String id;
  User user;
  Video video;

  View({
    required this.id,
    required this.user,
    required this.video,
  });
}

class Password {
  User user;
  String hash;

  Password({
    required this.user,
    required this.hash,
  });
}
