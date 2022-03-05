import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/view/additional_information.dart';
import 'package:weather_app/view/current_widget.dart';

import 'model/weather_model.dart';

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
  Weather? data;
  

  Future<void> getData() async{
    data = await client.getCurrentWeather("Pune");
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
        future: getData(), 
        builder: (context, snapshot) { 
          if(snapshot.connectionState == ConnectionState.done){
            // display here if we get data from api
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(Icons.wb_sunny_rounded, "${data!.temp}", "${data!.cityName}"),
                SizedBox(height: 60.0,),
                Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                additionalInformation("${data!.wind}", "${data!.humidity}", "${data!.pressure}", "${data!.feels_like}")
              ],
            );
          }else if(snapshot == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return Container();
        },
        
      ),
    );
  }
}
