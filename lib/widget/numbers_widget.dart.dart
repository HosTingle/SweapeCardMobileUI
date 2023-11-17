import 'package:flutter/material.dart';
import 'package:untitled4/Model/Word.dart';

import '../Service/Word_Service.dart';

class NumbersWidget extends StatelessWidget {
  Users? saaaa;
  Users users= Users();
  wordservice wordService= wordservice();
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(text: 'Projects', value: 39),
      buildDivider(),
      buildButton(text: 'Following', value: 529),
      buildDivider(),
      buildButton(text: 'Followers', value: 5834),
    ],
  );
  Widget buildDivider() => Container(
    height: 24,
    child: VerticalDivider(),
  );

  Widget buildButton({
    required String text,
    required int value,
  }) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$value',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
}