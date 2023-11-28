class Users {
  int? userId;
  String? imagePath;
  String? username;
  String? password;
  String? name;
  String? surname;
  DateTime? birthDate;
  String? phone;
  String? description;
  int? score;
  bool? status;
  int? wordCounter;

  Users({
    this.userId,
    this.imagePath,
    this.username,
    this.password,
    this.name,
    this.surname,
    this.birthDate,
    this.phone,
    this.description,
    this.score,
    this.status,
    this.wordCounter
  });
  Users.fromJson(Map<String, dynamic> json) {
    userId = json['userId']?.toInt();
    imagePath = json['imagePath']?.toString();
    username = json['username']?.toString();
    password= json['password']?.toString();
    name = json['name']?.toString();
    surname = json['surname']?.toString();
    birthDate = DateTime.parse(json['birthDate'].toString());
    phone = json['phone']?.toString();
    description = json['description']?.toString();
    score = json['score']?.toInt();
    status = json['status'];
    wordCounter = json['wordCounter']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId ;
    data['imagePath'] =imagePath;
    data['username'] = username;
    data['password'] = password;
    data['name'] = name;
    data['surname']=surname;
    data['birthDate'] = birthDate;
    data['phone'] = phone;
    data['description'] = description;
    data['score'] = score;
    data['status'] = status;
    data['wordCounter']=wordCounter;
    return data;
  }
}