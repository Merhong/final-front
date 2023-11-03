import 'package:flutter/material.dart';

class CardButton extends StatefulWidget {
  final String cardType;

  CardButton(this.cardType);

  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  String selectedCard = '카드선택';

  void selectCard(String card) {
    setState(() {
      selectedCard = card;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          ' $selectedCard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        PopupMenuButton<String>(
          icon: Icon(Icons.credit_card),
          onSelected: selectCard,
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: '농협카드',
                child: Text('농협카드'),
              ),
              PopupMenuItem<String>(
                value: '신한카드',
                child: Text('신한카드'),
              ),
              PopupMenuItem<String>(
                value: '우리카드',
                child: Text('우리카드'),
              ),
              PopupMenuItem<String>(
                value: '삼성카드',
                child: Text('삼성카드'),
              ),
            ];
          },
        ),
      ],
    );
  }
}
