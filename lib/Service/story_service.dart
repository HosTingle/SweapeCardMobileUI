import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class StoryService {

  Future<Map<String, List<String>>> getStoryData() async {
    try {
      final response = await http.get(Uri.parse('http://kelimelog.com/a2-seviyesi-ingilizce-hikayeler/'));
      if (response.statusCode == 200) {
        dom.Document document = parser.parse(response.body);
        Map<String, List<String>> storyData = {};

        // Başlık ve paragrafları içeren elementleri seç
        var storyElements = document.querySelectorAll('article');

        for (var storyElement in storyElements) {
          // Başlıkları içeren elementleri seç
          var titleElements = storyElement.querySelectorAll('h5');

          for (var titleElement in titleElements) {
            // Başlığın içindeki span etiketlerini kontrol et
            var spanElements = titleElement.querySelectorAll('span');
            var title = spanElements.isNotEmpty ? spanElements.first.text.trim() : titleElement.text.trim();

            if (title.isNotEmpty) {
              // Paragrafları içeren elementleri seç
              var paragraphElements = storyElement.querySelectorAll('p');
              var paragraphs = paragraphElements.map((element) => element.text.trim()).toList();

              if (paragraphs.isNotEmpty) {
                // Başlık ve paragrafları ekle
                storyData[title] = paragraphs;
              }
            }
          }
        }

        if (storyData.isEmpty) {
          print('Uyarı: Hikaye verisi bulunamadı.');
        }

        return storyData;
      } else {
        throw Exception('HTTP request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getStoryData: $e');
      throw Exception('Failed to load story data. Check your internet connection.');
   }
    }
}