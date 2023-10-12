class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final List posts;

  UserModel(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.username,
      required this.posts});
// converts the user data into a UserModel object
  Map<String, dynamic> toJson() => {
        'email': email,
        'uid': uid,
        'photoUrl': photoUrl,
        'username': username,
        'posts': posts,
      };
}

class CommentModel {
  final String userID;
  final String text;
  final DateTime timestamp;

  CommentModel({required this.userID, required this.text, required this.timestamp});
  Map<String, dynamic> toJson() =>
      {"userID": userID, "text": text, "timestamp": timestamp};
}
