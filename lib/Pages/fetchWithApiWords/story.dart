import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Service/story_service.dart';


class StoryPage extends StatefulWidget {


  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  bool isLoading = true;
  StoryService _storyService = StoryService();
  Map<String, List<String>> storyData = {};

  @override
  void initState() {
    super.initState();
    _loadStoryData();
  }

  Future<void> _loadStoryData() async {
    try {
      Map<String, List<String>> data = await _storyService.getStoryData();
      setState(() {
        storyData.addAll(data);
        isLoading = false;
      });
    } catch (e) {
      print('Hata: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: isLoading
            ? SpinKitHourGlass(
          color: Colors.black,
          size: 50,
        )
            : ListView.builder(
            itemCount: storyData.keys.length,
            itemBuilder: (context, index) {
              String title = storyData.keys.elementAt(index);
              List<String> paragraphs = storyData[title] ?? [];
              return Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: paragraphs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            paragraphs[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            ),
       );
    }
}