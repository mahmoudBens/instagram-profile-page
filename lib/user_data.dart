
// Data Model
class UserData {
  String username;
  String displayName;
  String bio;
  String profilePicUrl;
  int posts;
  int followers;
  int following;
  List<String> postImages;
  List<String> storyHighlights;

  UserData({
    required this.username,
    required this.displayName,
    required this.bio,
    required this.profilePicUrl,
    required this.posts,
    required this.followers,
    required this.following,
    required this.postImages,
    required this.storyHighlights,
  });
}
