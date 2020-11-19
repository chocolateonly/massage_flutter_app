class User {
  String id;
  String username;
  String nickname;
  String mobile;
  String headpic;
  String token;
  String uid;

  User({this.id,
    this.username,
    this.nickname,
    this.mobile,
    this.headpic,
    this.token,
    this.uid});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    nickname = json['nickname'];
    mobile = json['mobile'];
    headpic = json['headpic'];
    token = json['token'];
    uid = json['uid'];
  }
}
