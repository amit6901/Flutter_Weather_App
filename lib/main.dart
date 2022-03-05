import 'package:flutter/material.dart';
import 'package:weather_app/view/additional_information.dart';
import 'package:weather_app/view/current_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // custom widget for the app
          currentWeather(Icons.wb_sunny_rounded, "32.3", "Pune"),
          SizedBox(
            height: 60.0,
          ),
          Text(
            "Additional Information",
            style: TextStyle(
              fontSize: 24.0,
              color: Color(0xdd212121),
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          //additional information widget
          additionalInformation("24", "2", "1014", "24.6"),
          // UI is ready
          // starting of integrating the API
        ],
      ),
    );
  }
}
