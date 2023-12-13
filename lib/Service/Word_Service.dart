import 'dart:convert';
import 'dart:io';

import 'package:untitled4/Model/Word.dart';
import 'package:http/http.dart' as http;
class wordservice {
  Future<Words?> fetchWord() async {
    print("fetch called");
    String url="https://10.0.2.2:7193/api/Word/17GetByWordId";
    final uri= Uri.parse(url);
    final response=await http.get(uri);
    if (response.statusCode == 200) {
      // API yanıtı başarılı ise
      final dynamic pasa = json.decode(response.body);
      // Her bir Map'ı Words nesnesine dönüştürün
      final dynamic wordle= Words.fromJson(pasa);

      print("completed");
      return wordle;
    } else {
      // Hata durumu ile başa çıkma
      throw Exception('Failed to load data from the API');
    }

  }
  Future<Words?> wordas() async {
      Words myWord = Words(
        wordId: 2,
        userId: 1,
        firstWord: "Apple",
        secondWord: "Elma",
        sentence: "sdfsdfsdfsd",
        image: "dsfsdfdsf",
        descriptionWord: "dsfsdfsdf",
        showCounter: 0,
        languageId: 1,
      );
      return myWord;


  }
  Future<List<Words>> fetchWords(int? id) async {
    print("fetch called");
    String url="https://10.0.2.2:7193/api/word/getallword?id=$id";
    final uri= Uri.parse(url);
    final response=await http.get(uri);
    if (response.statusCode == 200) {
      // API yanıtı başarılı ise
      final List<dynamic> parsedList = json.decode(response.body);

      // Her bir Map'ı Words nesnesine dönüştürün
      List<Words> wordsList = parsedList.map((map) => Words.fromJson(map)).toList();

      print("completed");
      return wordsList;
    } else {
      // Hata durumu ile başa çıkma
      throw Exception('Failed to load data from the API');
    }

  }
  Future<List<Words>> fetchUser(int? id) async {
    print("fetch called");
    String url="https://10.0.2.2:7193/api/users/${id}getbyuserid";
    final uri= Uri.parse(url);
    final response=await http.get(uri);
    if (response.statusCode == 200) {
      // API yanıtı başarılı ise
      final List<dynamic> parsedList = json.decode(response.body);
      // Her bir Map'ı Words nesnesine dönüştürün
      List<Words> wordsList = parsedList.map((map) => Words.fromJson(map)).toList();

      print("completed");
      return wordsList;
    } else {
      // Hata durumu ile başa çıkma
      throw Exception('Failed to load data from the API');
    }

  }
   Future<List<Words>?>? deleteWords(int? id) async{
     print("fetch called");
     String url="https://10.0.2.2:7193/api/word/deleteword?id=$id";
     final uri= Uri.parse(url);
     final response=await http.delete(uri);
     if(response.statusCode==200){
       print("basarili");
       return null;
     }
     else
       throw Exception('Failed to delete data from the API');
   }
  Future<List<Words>?>? updateWords(int? id) async{
    print("fetch called");
    String url="https://10.0.2.2:7193/api/word/updatewordshowcounter?id=$id";
    final uri= Uri.parse(url);
    final response=await http.put(uri);
    if(response.statusCode==200){
      print("basarili");
      return null;
    }
    else
      throw Exception('Failed to update data from the API');
  }
  Future<void> addWords(Words? words) async{
    var request={
      "userId": words?.userId!.toInt(),
      "firstWord": words?.firstWord.toString(),
      "secondWord": words?.secondWord.toString(),
      "sentence": words?.sentence.toString(),
      "image": words?.image.toString(),
      "descriptionWord": words?.descriptionWord.toString(),
      "showCounter": words?.showCounter.toString(),
      "languageId":words?.languageId!.toInt(),
    };
    print("fetch called");
    String url="https://10.0.2.2:7193/api/Word/CreatWord";
    final uri= Uri.parse(url);
    final response=await http.post(uri, body:jsonEncode(request),headers: {
      'Content-Type': 'application/json', // Content-Type başlığını ekleyin
    },
    );
    if (response.statusCode == 200) {
      // API yanıtı başarılı ise
      print("completed");

    } else {
      // Hata durumu ile başa çıkma
      throw Exception('Failed to load data from the API');
    }
  }

}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
