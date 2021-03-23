
class CommentModel {
  String nickName;
  String avatar;
  String content;

  CommentModel.fromJson(Map data) {
    nickName = data['nickName'];
    avatar = data['userPhoto'];
    content = data['text'];
  }
}