import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage1/pages/states.dart';

//
//
//This is a statefull widget
//
//

class Second extends StatefulWidget {
  final String username2, email2;
  final String date2, city2, state;
  Second({
    Key? key,
    required this.username2,
    required this.email2,
    required this.date2,
    required this.city2,
    required this.state,
  }) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  var temp;
  var humidity;
  var weather;
  var windspeed;

  void getweather() async {
    Response response =
        await get(Uri.https('api.openweathermap.org', 'data/2.5/weather', {
      'q': 'bengaluru', //widget.state,
      'units': 'metric',
      'appid': '8df3195f332ce4b0ec9fdddda6e3dff5'
    }));
    var results = jsonDecode(response.body);
    print(results);
    setState(() {
      this.temp = results['main']['temp'];
      this.humidity = results['main']['humidity'];
      this.weather = results['weather'][0]['description'];
      this.windspeed = results['wind']['speed'];
    });
  }

  String username2 = 'second screen',
      email2 = 'second screen',
      date2 = 'age,',
      city2 = 'city2';

  @override
  void initState() {
    super.initState();
    this.getweather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast'),
          // centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                // getweather(),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Welcome ${widget.username2}',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' Your Email : ${widget.email2}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' Your Birthdate : ${widget.date2}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' Your City : ${widget.city2}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Weather Today ',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 60,
                  color: Colors.blue,
                ),
                //
                //containing weather data
                //
                //
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.temperatureHalf),
                        title: Text('Temperature'),
                        trailing: Text(temp != null
                            ? temp.toString() + " \u00B0C"
                            : "loading..."),
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.cloudSun),
                        title: Text('Weather'),
                        trailing: Text(weather != null
                            ? weather.toString()
                            : "loading..."),
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.dropletSlash),
                        title: Text('Humidity'),
                        trailing: Text(humidity != null
                            ? humidity.toString()
                            : "loading..."),
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.wind),
                        title: Text('Wind speed'),
                        trailing: Text(windspeed != null
                            ? windspeed.toString() + ' km/h'
                            : "loading..."),
                      ),
                      Divider(
                        height: 60,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return States();
                          }));
                        }),
                        child: Text('click here to view\n    Indian States')),
                    Text(
                      'Thank You,\n Visit Again',
                      style: TextStyle(color: Colors.grey[800], fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
