import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import '../Model/Webword.dart';

class WebService {
  Future<List<Word>> getWebsiteData() async {
    try {
      final response = await http.get(Uri.parse('https://www.turkishtextbook.com/most-common-words/'));
      if (response.statusCode == 200) {
        dom.Document document = parser.parse(response.body);
        List<Word> words = [];
        // Tablonun bulunduğu elementi seç
        var tableElement = document.querySelector('.elementor-element-19ee40a table');
        // Her bir tablo satırını seç
        var rows = tableElement?.querySelectorAll('tr');

        if (rows != null) {
          // İlk satır genellikle başlık olduğu için atlıyoruz
          for (var i = 1; i < rows.length; i++) {
            var columns = rows[i].querySelectorAll('td');
            if (columns.length >= 2) {
              String english = columns[1].text.trim();
              String turkish = columns[0].text.trim();
              String pronunciation = columns.length > 2
                  ? columns[2].text.trim()
                  : '';
              words.add(Word(
                  turkish: turkish,
                  english: english,
                  pronunciation: pronunciation));
            }
          }
        }
        if (words.isEmpty) {
          print('Uyarı: titles listesi boş.');
        }

        return words;
      } else {
        throw Exception('HTTP request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchData: $e');
      throw Exception('Failed to load data');
    }}


}