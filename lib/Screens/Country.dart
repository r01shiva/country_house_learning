import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'CountryMap.dart';

class Country extends StatelessWidget {
  // final Map country;
  static const routeName = '/country';
  // Country(this.country);

  @override
  Widget build(BuildContext context) {
    final Map country = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            CountryFlipCard(
              front: 'Capital',
              back: country['capital'],
              colorValue: Colors.deepOrange,
            ),
            CountryFlipCard(
              front: 'Population',
              back: country['population'].toString(),
              colorValue: Colors.deepPurple,
            ),
            FlipCard(
              front: CountryCard(title: 'Flag'),
              back: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Center(
                    child: Center(
                        child: SvgPicture.network(country['flag'],
                            height: 140, width: 140)),
                  )
              ),
            ),
            CountryFlipCard(
              front: 'Currency',
              back: country['currencies'][0]['code'],
              colorValue: Colors.blue,
            ),
            GestureDetector(onTap: () {
              Navigator.of(context).pushNamed('/country-map', arguments: {
                'name' : country['name'],
                'latlng' : country['latlng']
              });
            }, child: CountryCard(title: 'Show on Map'),)
          ],
        ),
      ),
    );
  }
}

class CountryFlipCard extends StatelessWidget {
  final String front;
  final String back;
  final MaterialColor colorValue;

  CountryFlipCard({this.front, this.back, this.colorValue});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: CountryCard(title: front),
      back: CountryDetailCard(value: back, colorValue: colorValue),
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String value;
  final MaterialColor colorValue;

  CountryDetailCard({this.value, this.colorValue});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: colorValue,
        elevation: 10,
        child: Center(
          child: Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ));
  }
}

class CountryCard extends StatelessWidget {
  final String title;

  const CountryCard({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
