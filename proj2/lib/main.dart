import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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

    Widget chartSection = Container(
      height: 300, 
      child: SimpleSeriesLegend.withSampleData()
    );

    return MaterialApp(
      title: 'SnowFooCast &Analytics',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnowFooCast & Analytics'),
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
            textSection,
            chartSection
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

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

class SimpleSeriesLegend extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleSeriesLegend(this.seriesList, {this.animate});

  factory SimpleSeriesLegend.withSampleData() {
    return new SimpleSeriesLegend(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [new charts.SeriesLegend()],      
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<SnowFall, String>> _createSampleData() {
    final decData = [
      new SnowFall('2014', 5),
      new SnowFall('2015', 25),
      new SnowFall('2016', 100),
      new SnowFall('2017', 75),
    ];

    final janData = [
      new SnowFall('2014', 25),
      new SnowFall('2015', 50),
      new SnowFall('2016', 10),
      new SnowFall('2017', 20),
    ];

    final febData = [
      new SnowFall('2014', 10),
      new SnowFall('2015', 15),
      new SnowFall('2016', 50),
      new SnowFall('2017', 45),
    ];

    final marData = [
      new SnowFall('2014', 20),
      new SnowFall('2015', 35),
      new SnowFall('2016', 15),
      new SnowFall('2017', 10),
    ];

    return [
      new charts.Series<SnowFall, String>(
        id: 'Dec',
        domainFn: (SnowFall snow, _) => snow.year,
        measureFn: (SnowFall snow, _) => snow.snow,
        data: decData,
      ),
      new charts.Series<SnowFall, String>(
        id: 'Jan',
        domainFn: (SnowFall snow, _) => snow.year,
        measureFn: (SnowFall snow, _) => snow.snow,
        data: janData,
      ),
      new charts.Series<SnowFall, String>(
        id: 'Feb',
        domainFn: (SnowFall snow, _) => snow.year,
        measureFn: (SnowFall snow, _) => snow.snow,
        data: febData,
      ),
      new charts.Series<SnowFall, String>(
        id: 'Mar',
        domainFn: (SnowFall snow, _) => snow.year,
        measureFn: (SnowFall snow, _) => snow.snow,
        data: marData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class SnowFall {
  final String year;
  final int snow;

  SnowFall(this.year, this.snow);
}