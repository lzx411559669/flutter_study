import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: buildHomePage('Strawberry Pavlova Recipe'),
    );
  }

  Widget buildHomePage(String title) {
    const titleText = Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "Strawberry Pavlova",
        style: TextStyle(
            fontWeight: FontWeight.w800, letterSpacing: 0.5, fontSize: 30),
      ),
    );

    const subTitle = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
      'topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25,
      ),
    );

    final stars = Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.star, color: Colors.orange),
      Icon(Icons.star, color: Colors.orange),
      Icon(Icons.star, color: Colors.orange),
      Icon(Icons.star, color: Colors.orange),
      Icon(Icons.star_border, color: Colors.orange),
    ]);

    final ratings = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 20,
                letterSpacing: 0.5),
          )
        ],
      ),
    );

    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final iconList = DefaultTextStyle(
        style: descTextStyle,
        child: Container(
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(children: [
              Icon(Icons.kitchen, color: Colors.green[500]),
              Text('PREP TIME'),
              Text('25 min'),
            ]),
            Column(children: [
              Icon(Icons.timer, color: Colors.green[500]),
              Text('COOKING TIME'),
              Text('1 hr'),
            ]),
            Column(children: [
              Icon(Icons.restaurant, color: Colors.green[500]),
              Text('YIELD'),
              Text('4 servings'),
            ])
          ]),
        ));

    final leftColumn = Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          children: [titleText, subTitle, ratings, iconList],
        ));

    final mainImage = Image.asset(
      'images/pavlova.jpg',
      fit: BoxFit.cover,
      // width: 400,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          // height: 600,
          child: Card(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 440,
                child: leftColumn,
              ),
              mainImage
            ]),
          ),
        )));
  }
}
