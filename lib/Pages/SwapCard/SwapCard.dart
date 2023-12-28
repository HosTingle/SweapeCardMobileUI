import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../Model/Word.dart';
import '../../provider/card_provider.dart';

class SwapCard extends StatefulWidget {
  final Words words;
  final bool isFront;

  const SwapCard({
    Key? key,
    required this.words,
    required this.isFront,
  }) : super(key: key);

  @override
  State<SwapCard> createState() => _SwapCardState();
}

class _SwapCardState extends State<SwapCard> {
 final FlutterTts flutterTts= FlutterTts();
  void speak(String asas) async{
     await flutterTts.setLanguage("en-US");
     await flutterTts.setPitch(1.2);
     await flutterTts.speak(asas);
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: widget.isFront ? buildFrontCard() : buildCard(),
  );

  Widget buildFrontCard() => GestureDetector(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final provider = Provider.of<CardProvider>(context);
        final position = provider.position;
        final milliseconds = provider.isDragging ? 0 : 400;

        final center = constraints.smallest.center(Offset.zero);
        final angle = provider.angle * pi / 180;
        final rotatedMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);

        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: milliseconds),
          transform: rotatedMatrix..translate(position.dx, position.dy),
          child: Stack(
            children: [
              buildCard(),
              buildStamps(),

            ],
          ),
        );
      },
    ),
    onPanStart: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.startPosition(details);
    },
    onPanUpdate: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);

      provider.updatePosition(details);
    },
    onPanEnd: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);

      provider.endPosition();
    },
  );

  Widget buildCard() => buildCardShadow(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Kenarları siyah yapar
        ),
        child: FlipCard(
          fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
          direction: FlipDirection.HORIZONTAL, // default
          side: CardSide.FRONT, // The side to initially display.
          front: Container(

            padding: EdgeInsets.all(20),
            child: Container(
              child: Center(child: buildName()),
            ),
          ),
          back: Container(color: Colors.white,child:
              buildbackName()
          ),
        ),
      ),
    ),
  );

  Widget buildCardShadow({required Widget child}) => ClipRRect(
    borderRadius: BorderRadius.circular(22),
    child: Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 20,
            blurRadius: 20,
            color: Colors.black,
          ),
        ],
      ),
      child: child,
    ),
  );

  Widget buildStamps() {
    final provider = Provider.of<CardProvider>(context);
    final status = provider.getStatus();
    final opacity = provider.getStatusOpacity();

    switch (status) {
      case CardStatus.like:
        final child = buildStamp(
          angle: -0.5,
          color: Colors.green,
          text: 'Rager That',
          opacity: opacity,
        );

        return Positioned(top: 64, left: 50, child: child);
      case CardStatus.dislike:
        final child = buildStamp(
          angle: 0.5,
          color: Colors.blue,
          text: 'Again',
          opacity: opacity,
        );

        return Positioned(top: 44, right: 50, child: child);
      case CardStatus.superLike:
        final child = Center(
            child: buildStamp(
              color: Colors.red,
              text: 'Delete',
              opacity: opacity,
            ),
          );

        return Positioned(bottom: 128, right: 0, left: 0, child: child);
      default:
        return Container();
    }
  }

  Widget buildStamp({
    double angle = 0,
    required Color color,
    required String text,
    required double opacity,
  }) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 48,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      ),
    );
  }

  Widget buildActive() => Row(

    children: [
      Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        width: 12,
        height: 12,
      ),
      const SizedBox(width: 8),
      const Text(
        'Recently Active',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ],
  );
  Widget buildbackName() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(height: 55),
    Text(
      widget.words.firstWord!,
      style: const TextStyle(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(// Düşündüğünüz metin yüksekliği kadar bir değer belirleyin
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.words.sentence!,
              textAlign: TextAlign.center, // Metni yatayda da ortala
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      )
  ]
  );

  Widget buildName() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon:const FaIcon(FontAwesomeIcons.microphone,color: Colors.black),
            onPressed: () {
              String nonNullableString = widget.words.secondWord!;
             speak(nonNullableString);
            },
            iconSize: 30.0, // İkonun boyutu
          ),
          Text(
            widget.words.secondWord!,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  );


}
