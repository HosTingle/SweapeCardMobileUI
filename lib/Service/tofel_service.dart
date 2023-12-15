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

              // Türkçe kelimenin içindeki "(n )" gibi ifadeleri temizleme
              var turkish = row.innerHtml.replaceAllMapped(RegExp(r'<.*?>'), (match) => '').trim();

              var pronunciation = '';  // Pronunciation bilgisi yok gibi görünüyor.

              words.add(Word(
                turkish: turkish,
                english: english,
                pronunciation: pronunciation,
              ));
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