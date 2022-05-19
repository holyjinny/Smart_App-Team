import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:smart_jtj/config/size_config.dart';

import 'detail_weather.dart';
import 'extra_weather.dart';
import 'weather_data.dart';

Weather? currentTemp;
Weather? tomorrowTemp;
List<Weather>? todayWeather;
List<Weather>? sevenDay;
String lat = "35.162441";
String lon = "126.910339";
String city = "Gwangju";

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  getData() async {
    fetchData(lat, lon, city).then((value) {
      currentTemp = value[0];
      todayWeather = value[1];
      tomorrowTemp = value[2];
      sevenDay = value[3];
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: currentTemp == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [CurrentWeather(getData), TodayWeather()],
            ),
    );
  }
}

class CurrentWeather extends StatefulWidget {
  final Function() updateData;

  CurrentWeather(this.updateData);

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  bool searchBar = false;
  bool updating = false;
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (searchBar)
          setState(() {
            searchBar = false;
          });
      },
      child: GlowContainer(
        height: getProportionateScreenHeight(400),
        padding: EdgeInsets.only(
          top: 50,
          left: 30,
          right: 30,
        ),
        glowColor: Color(0xFF65B0DE).withOpacity(0.8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        color: Color(0xFF65B0DE),
        spreadRadius: 5,
        child: Column(
          children: [
            Container(
              child: searchBar
                  ? TextField(
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Color(0xFF65B0DE),
                        filled: true,
                        hintText: "도시 이름을 영어로 검색해주세요.",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) async {
                        CityModel? temp = await fetchCity(value);
                        if (temp == null) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Color(0xFF65B0DE),
                                title: Text("찾을 수 없습니다."),
                                content: Text("다시 한번 입력해주세요."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("확인"),
                                  )
                                ],
                              );
                            },
                          );
                          searchBar = false;
                          return;
                        }
                        city = temp.name!;
                        lat = temp.lat!;
                        lon = temp.lon!;
                        updating = true;
                        setState(() {});
                        widget.updateData();
                        searchBar = false;
                        updating = false;
                        setState(() {});
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.map_fill,
                              color: Color(0xffc2ff00),
                            ),
                            GestureDetector(
                              onTap: () {
                                searchBar = true;
                                setState(() {});
                                focusNode.requestFocus();
                              },
                              child: Text(
                                " " + city,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ],
                    ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.2,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                updating ? "Updating" : "Updated",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 300,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(currentTemp!.image!),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Column(
                        children: [
                          GlowText(
                            currentTemp!.current.toString() + '°',
                            style: TextStyle(
                              height: 0.1,
                              fontSize: 120,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            currentTemp!.name!,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            currentTemp!.day!,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            ExtraWeather(currentTemp!),
          ],
        ),
      ),
    );
  }
}

class TodayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DetailPage(
                          tomorrowTemp!,
                          sevenDay!,
                        );
                      },
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "7 days ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherWidget(todayWeather![0]),
                WeatherWidget(todayWeather![1]),
                WeatherWidget(todayWeather![2]),
                WeatherWidget(todayWeather![3]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget(this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        children: [
          Text(
            weather.current.toString() + "\u00B0",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage(
              weather.image!,
            ),
            width: 50,
            height: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            weather.time!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
