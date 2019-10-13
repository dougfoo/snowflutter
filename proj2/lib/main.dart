import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Snow Sports Forecasting and Analytics',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Niseko, Japan',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
         ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.poll, 'VIZ'),
          _buildButtonColumn(color, Icons.grid_on, 'DATA'),
          _buildButtonColumn(color, Icons.help, 'HELP'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Using machine learning we forecast (Foo-Cast?) expected snowfall and weather conditions.'
        'This site uses Flutter for front end, Express.js backend, MongoDB, and Azure Machine Learning services.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'SnowFoo Analytics',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnowFoo Analytics'),
        ),
        body: ListView (            
          children: [            
            Image.asset(            
              'images/niseko2.jpg',            
               width: 600,            
               height: 300,            
               fit: BoxFit.cover,            
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        )
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}