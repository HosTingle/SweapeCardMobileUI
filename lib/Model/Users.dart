class Users {
  int? userId;
  int? avatarId;
  String? imagePath;
  String? username;
  String? password;
  String? name;
  String? surname;
  DateTime? birthDate;
  String? phone;
  String? description;
  int? scoreId;
  int? score;
  bool? status;
  int? wordCounter;
  int? wordCounterId;

  Users({
    this.userId,
    this.avatarId,
    this.imagePath,
    this.username,
    this.password,
    this.name,
    this.surname,
    this.birthDate,
    this.phone,
    this.description,
    this.scoreId,
    this.score,
    this.status,
    this.wordCounter,
    this.wordCounterId
  });
  Users.fromJson(Map<String, dynamic> json) {
    userId = json['userId']?.toInt();
    avatarId=json['avatarId']?.toInt();
    imagePath = json['imagePath']?.toString();
    username = json['username']?.toString();
    password= json['password']?.toString();
    name = json['name']?.toString();
    surname = json['surname']?.toString();
    birthDate = DateTime.parse(json['birthDate'].toString());
    phone = json['phone']?.toString();
    description = json['description']?.toString();
    scoreId=json['scoreId']?.toInt();
    score = json['score']?.toInt();
    status = json['status'];
    wordCounter = json['wordCounter']?.toInt();
    wordCounterId=json['wordCounterId']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId ;
    data['avatarId'] = avatarId ;
    data['imagePath'] =imagePath;
    data['username'] = username;
    data['password'] = password;
    data['name'] = name;
    data['surname']=surname;
    data['birthDate'] = birthDate;
    data['phone'] = phone;
    data['description'] = description;
    data['scoreId'] = scoreId ;
    data['score'] = score;
    data['status'] = status;
    data['wordCounter']=wordCounter;
    data['wordCounterId']=wordCounterId;
    return data;
  }
}