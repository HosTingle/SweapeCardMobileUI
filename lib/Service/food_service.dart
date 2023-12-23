import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

import '../Model/Webword.dart';


class ToeflWordsPage {
  Future<List<Word>> getWebsiteData() async {
    try {
      final response = await http.get(Uri.parse('https://ingilizce-kursu.gen.tr/ingilizce-yiyecekler-ve-icecekler/'));
      if (response.statusCode == 200) {
        dom.Document document = parser.parse(response.body);
        List<Word> words = [];

        // Tablonun bulunduğu elementi seç
        // Tabloların bulunduğu elementi seç
        var tableElements = document.querySelectorAll('.table-1');

        for (var tableElement in tableElements) {
          // Her bir tablonun satırlarını seç
          var rows = tableElement.querySelectorAll('tbody tr');

          for (var row in rows) {
            // Türkçe ve İngilizce kelimeleri çek
            var turkish = row.children[0].text.trim();
            var english = row.children[1].text.trim();

            words.add(Word(
              turkish: turkish,
              english: english,
              pronunciation: '',
            ));
          }

        }

        if (words.isEmpty) {
          print('Uyarı: Kelime listesi boş.');
        }

        return words;
      } else {
        throw Exception('HTTP request failed with status: ${response.statusCode}');
      }
    }  catch (e) {
      print('Error in fetchData: $e');
      throw Exception('Failed to load data');
    }
    }
}