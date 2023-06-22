import 'package:flutter/material.dart';
import 'package:weather_app/weatherData.dart';
import 'package:intl/intl.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MyHomePage extends StatelessWidget {
  // const MyHomePage({super.key});
  var client = WeatherData();
  var data;


  info() async{
    // var position = await getCurrentTag();
    data = await client.getData('19.0760', '72.8777');
    return data;
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: info(),
      builder: ((context, snapshot){
        return Container(
          child: Column(
            children: [
              Container(
                  height: size.height*0.75,
                  width: size.width,
                  padding: EdgeInsets.only(top: 50),
                  margin: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff955cd1),
                          Color(0xff3fa2fa),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.2 , 0.85],
                      )
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${data?.cityName}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 35,
                            fontFamily: 'Product Sans' ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        dateFormat,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 15,
                            fontFamily: 'Product Sans' ),
                      ),
                      // Image.asset('img/sun.png', width: size.width*0.45),
                       Image.network(
                         'https:${data?.icon}',
                         fit: BoxFit.cover,
                         width: size.width*0.4,
                       ),
                  Text(
                        '${data?.condition}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 50,
                            fontWeight:FontWeight.w500,
                            fontFamily: 'Product Sans' ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${data?.temp}°C',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 50,
                            fontWeight:FontWeight.w800,
                            fontFamily: 'Product Sans' ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'img/wind.png',
                                    width: size.width*0.15,),
                                  Text(
                                    '${data?.wind} km/h',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Product Sans',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Wind',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 17,
                                        fontWeight:FontWeight.w800,
                                        fontFamily: 'Product Sans' ),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'img/humidity.png',
                                    width: size.width*0.15,),
                                  Text(
                                    '${data?.humidity}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Product Sans',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Humidity',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 17,
                                        fontWeight:FontWeight.w800,
                                        fontFamily: 'Product Sans' ),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'img/direction.png',
                                    width: size.width*0.15,),
                                  Text(
                                    '${data?.wind_dir}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Product Sans',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Wind Direction',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 17,
                                        fontWeight:FontWeight.w800,
                                        fontFamily: 'Product Sans' ),
                                  ),
                                ],
                              )
                          )
                        ],

                      )
                    ],
                  )
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Gust',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Product Sans',
                                fontSize: 17
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.gust} kmph',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Product Sans',
                                fontSize: 23
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Pressure',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Product Sans',
                                fontSize: 17
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.pressure} hpa',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Product Sans',
                                fontSize: 23
                            ),
                          ),


                        ],
                      )),
                  Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'UV',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Product Sans',
                                fontSize: 17
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.uv}',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Product Sans',
                                fontSize: 23
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Precipitation',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Product Sans',
                                fontSize: 17
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.pricipe} mm',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Product Sans',
                                fontSize: 23
                            ),
                          ),


                        ],
                      )),
                  Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Wind',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Product Sans',
                                fontSize: 17
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.wind}km/h',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Product Sans',
                                fontSize: 23
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Last Update',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'Product Sans',
                                fontSize: 17
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.last_update}',
                            style: TextStyle(
                                color: Colors.greenAccent.withOpacity(0.5),
                                fontFamily: 'Product Sans',
                                fontSize: 14
                            ),
                          ),


                        ],
                      ))


                ],

              )],
          )
        );
      }
      ),
      )
    );
  }
}

