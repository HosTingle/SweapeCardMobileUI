
class WordsSupport{
  String? url;
  String? text;
  WordsSupport({
    this.url,
    this.text
  });
  WordsSupport.fromJson(Map<String,dynamic> json){
    url= json["url"]?.toString();
    text=json["text"]?.toString();
  }
  Map<String,dynamic> toJson(){
    final data=<String,dynamic>{};
    data["url"]=url;
    data["text"]=url;
    return data;

  }

}
class Words {
/*
{
  "wordId": 2,
  "userId": 1,
  "firstWord": "Apple",
  "secondWord": "Elma",
  "sentence": "sdfsdfsdfsd                                                                                                                                                                                             ",
  "image": "dsfsdfdsf",
  "descriptionWord": "dsfsdfsdf",
  "showCounter": 0,
  "languageId": 1
}
*/

  int? wordId;
  int? userId;
  String? firstWord;
  String? secondWord;
  String? sentence;
  String? image;
  String? descriptionWord;
  int? showCounter;
  int? languageId;

  Words({
    this.wordId,
    this.userId,
    this.firstWord,
    this.secondWord,
    this.sentence,
    this.image,
    this.descriptionWord,
    this.showCounter,
    this.languageId,
  });
  Words.fromJson(Map<String, dynamic> json) {
    wordId = json['wordId']?.toInt();
    userId = json['userId']?.toInt();
    firstWord = json['firstWord']?.toString();
    secondWord = json['secondWord']?.toString();
    sentence = json['sentence']?.toString();
    image = json['image']?.toString();
    descriptionWord = json['descriptionWord']?.toString();
    showCounter = json['showCounter']?.toInt();
    languageId = json['languageId']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['wordId'] = wordId;
    data['userId'] = userId;
    data['firstWord'] = firstWord;
    data['secondWord'] = secondWord;
    data['sentence'] = sentence;
    data['image'] = image;
    data['descriptionWord'] = descriptionWord;
    data['showCounter'] = showCounter;
    data['languageId'] = languageId;
    return data;
  }
}
class Users {
  int? userId;
  int? avatarId;
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

  Users({
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
  Users.fromJson(Map<String, dynamic> json) {
    userId = json['userId']?.toInt();
    avatarId = json['avatarId']?.toInt();
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
    data['UserId'] = userId ;
    data['AvatarId'] =avatarId;
    data['Username'] = username;
    data['Password'] = password;
    data['Name'] = name;
    data['Surname']=surname;
    data['BirthDate'] = birthDate;
    data['Phone'] = phone;
    data['Description'] = description;
    data['ScoreId'] = scoreId;
    data['Status'] = status;
    data['WordCounterId']=wordCounterId;
    return data;
  }
}
