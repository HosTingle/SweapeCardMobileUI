
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

