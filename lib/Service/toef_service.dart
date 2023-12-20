
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

import '../Model/Webword.dart';

class TOEFLService {

  Future<List<Word>> getWebsiteData(String selectedLetter) async {
    try {
      final response = await http.get(Uri.parse('http://kelimelog.com/ingilizce-$selectedLetter-harfi-ile-baslayan-toefl-sinav-kelimeleri/'));
      if (response.statusCode == 200) {
        dom.Document document = parser.parse(response.body);
        List<Word> words = [];

        // Tablonun bulunduğu elementi seç
        var tableElement = document.querySelector('.entry-content ul');
        // Her bir tablo satırını seç
        var rows = tableElement?.querySelectorAll('li');

        if (rows != null) {
          for (var row in rows) {
            var strongElement = row.querySelector('strong');

            if (strongElement != null) {
              var english = strongElement.text.trim();
              var turkishHtml = row.innerHtml.replaceAllMapped(RegExp(r'<.*?>'), (match) => '').trim();

              // Türkçe kelimeyi ayırmak için virgül kullandık.
              var turkishList = turkishHtml.split(',');

              // Eğer en az iki Türkçe karşılığı varsa, ikincisini al; yoksa ilkini al
              var turkish = turkishList.length >= 2 ? turkishList[1] : (turkishList.isNotEmpty ? turkishList.first : '');

              var pronunciation = '';

              // Aynı İngilizce kelimenin zaten eklenmediğini kontrol et
              bool alreadyExists = words.any((word) => word.english == english);

              if (!alreadyExists) {
                words.add(Word(
                  turkish: turkish,
                  english: english,
                  pronunciation: pronunciation,
                ));
              }
            }
          }
        }

        if (words.isEmpty) {
          print('Uyarı: Kelime listesi boş.');
        }

        return words;
      } else {
        throw Exception('HTTP request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchData: $e');
      throw Exception('Failed to load data');
    }
   }
}