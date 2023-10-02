class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final List posts;

  User(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.username,
      required this.posts});
// converts the user data into a User object
  Map<String, dynamic> toJson() => {
        'email': email,
        'uid': uid,
        'photoUrl': photoUrl,
        'username': username,
        'posts': posts,
      };
}
