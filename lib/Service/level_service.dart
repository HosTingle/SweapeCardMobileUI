import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

import '../Model/Webword.dart';

class WordsByLevelsService {
  Future<List<Word>> getWebsiteData(String seviye) async {
    try {
      // Kullanıcının seçtiği seviyeye göre URL'yi oluştur
      final response = await http.get(Uri.parse('https://evdeingilizcem.com/$seviye-seviye-ingilizce-kelimeler/'));
      if (response.statusCode == 200) {
        dom.Document document = parser.parse(response.body);
        List<Word> words = [];

        // Tablonun bulunduğu elementi seç
        var tableElement = document.querySelector('.wp-block-table.is-style-stripes');
        // Her bir tablo satırını seç
        var rows = tableElement?.querySelectorAll('tbody tr');

        if (rows != null) {
          for (var row in rows) {
            var columns = row.querySelectorAll('td');
            if (columns.length >= 2) {
              var symbol = columns[0].querySelector('span')?.text.trim();
              var english = columns[0].text.replaceAll(symbol ?? '', '').trim();
              var turkish = columns[1].text.trim();
              var pronunciation = columns.length > 2 ? columns[2].text.trim() : '';

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