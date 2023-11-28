class User {
  int? userId;
  String? avatarId;
  String? username;
  String? password;
  String? name;
  String? surname;
  DateTime? birthDate;
  String? phone;
  String? description;
  int? scoreId;
  bool? status;
  int? wordCounterId;

  User({
    this.userId,
    this.avatarId,
    this.username,
    this.password,
    this.name,
    this.surname,
    this.birthDate,
    this.phone,
    this.description,
    this.scoreId,
    this.status,
    this.wordCounterId
  });
  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId']?.toInt();
    avatarId = json['avatarId']?.toString();
    username = json['username']?.toString();
    password= json['password']?.toString();
    name = json['name']?.toString();
    surname = json['surname']?.toString();
    birthDate = DateTime.parse(json['birthDate'].toString());
    phone = json['phone']?.toString();
    description = json['description']?.toString();
    scoreId = json['scoreId']?.toInt();
    status = json['status'];
    wordCounterId = json['wordCounterId']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId ;
    data['avatarId'] =avatarId;
    data['username'] = username;
    data['password'] = password;
    data['name'] = name;
    data['surname']=surname;
    data['birthDate'] = birthDate;
    data['phone'] = phone;
    data['description'] = description;
    data['scoreId'] = scoreId;
    data['status'] = status;
    data['wordCounterId']=wordCounterId;
    return data;
  }
}