import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

final List<List<CircularStackEntry>> _pieData = [
  <CircularStackEntry>[
    CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(500.0, Color(0xFFC41A3B), rankKey: 'D1'),
        CircularSegmentEntry(1000.0, Color(0xFF1B1F32), rankKey: 'D2'),
        CircularSegmentEntry(2000.0, Colors.green, rankKey: 'D3'),
        CircularSegmentEntry(1000.0, Colors.yellow, rankKey: 'D4'),
      ],
      rankKey: 'Profits Data',
    ),
  ],
  <CircularStackEntry>[
    CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(1500.0, Color(0xFFC41A3B), rankKey: 'D1'),
        CircularSegmentEntry(750.0, Color(0xFF1B1F32), rankKey: 'D2'),
        CircularSegmentEntry(2000.0, Colors.green, rankKey: 'D3'),
        CircularSegmentEntry(1000.0, Colors.yellow, rankKey: 'D4'),
      ],
      rankKey: 'Profits Data',
    ),
  ],
  <CircularStackEntry>[
    CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(1800.0, Color(0xFFC41A3B), rankKey: 'D1'),
        CircularSegmentEntry(2900.0, Color(0xFF1B1F32), rankKey: 'D2'),
        CircularSegmentEntry(4000.0, Colors.green, rankKey: 'D3'),
        CircularSegmentEntry(7000.0, Colors.yellow, rankKey: 'D4'),
      ],
      rankKey: 'Profits Data',
    ),
  ],
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<AnimatedCircularChartState> _key = GlobalKey<AnimatedCircularChartState>();

  String title = 'Circular Chart ( Pie Chart )';

  final _size = Size(400.0, 400.0);

  int index = 0;

  void _cycle() {
    setState(() {
      index++;
      List<CircularStackEntry> _data = _pieData[index % 3];
      _key.currentState.updateData(_data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedCircularChart(
          key: _key,
          size: _size,
          initialChartData: _pieData[0],
          chartType: CircularChartType.Pie,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cycle,
        child: Icon(Icons.refresh),
        backgroundColor: Color(0xFFC41A3B),
      ),
    );
  }
}
