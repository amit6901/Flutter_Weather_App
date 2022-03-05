import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_api_client.dart';
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
  // call the api in init state function
  WeatherApiClient client = WeatherApiClient();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client.getCurrentWeather("Georgia");
    //Call the api by future builder widget
  }

  Future<void> getData() async{
    data = await client.get
  }

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
      body: FutureBuilder(
        
      ),
    );
  }
}
