class User {
  final String  uid;
  final String  firstName;
  final String? lastName;
  final String? username;
  final String  email;
  final String? phoneNumber;
  final String? profilePic;

  // List<Video>? videos;
  // List<Like>? likes;
  // List<Comment>? comments;

  User({
    required this.uid,
    required this.firstName,
    this.lastName,
    this.username,
    required this.email,
    this.phoneNumber,
    this.profilePic,
    // this.videos,
    // this.likes,
    // this.comments,
  });
}
