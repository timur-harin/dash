import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dash/utils/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:dash/common.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

import 'package:icon_forest/iconoir.dart';
import 'package:iconforest_icon_park/icon_park.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const DashBoardApp());
}

class DashBoardApp extends StatelessWidget {
  const DashBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: commonTheme(),
      debugShowCheckedModeBanner: false,
      home: const MainPage(
          title: 'Цифровая модель управления энергетической гибкостью'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _value = 40.0;
  var size = window.physicalSize;
  var height = WidgetsBinding.instance.window.physicalSize.height;
  var width = WidgetsBinding.instance.window.physicalSize.width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height - 56;
    width = size.width;
    const ticks = [1, 2, 3, 4, 5];
    var features = ["₽", "⚠", "СО2"];
    const data = [
      [5, 2, 4],
      [3, 1, 5],
      [3, 4, 1],
      [2, 3, 3]
    ];
    const defaultGraphColors = [
      Colors.green,
      Colors.blue,
      Colors.red,
      Colors.orange,
    ];

    return Scaffold(
        backgroundColor: Common.background,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
          SizedBox(
            height: height * 0.275,
            width: width,
            child: Row(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    height: height * 0.275,
                    width: width * 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Спрос на мощность",
                                style: Theme.of(context).textTheme.headline6),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: SfSlider(
                                min: 100,
                                max: 500,
                                stepSize: 100,
                                value: _value,
                                interval: 100,
                                showTicks: true,
                                showLabels: true,
                                enableTooltip: true,
                                minorTicksPerInterval: 1,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                              ),
                            ),
                            Text("Критерии оптимизации",
                                style: Theme.of(context).textTheme.headline6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {},
                                    style:
                                        commonTheme().elevatedButtonTheme.style,
                                    child: const Icon(
                                        Icons.currency_ruble_outlined),
                                  ),
                                  Text("Экономичность",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ]),
                                Column(children: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: commonTheme()
                                          .elevatedButtonTheme
                                          .style,
                                      child:
                                          const Icon(Icons.warning_outlined)),
                                  Text("Надежность",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ]),
                                Column(children: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: commonTheme()
                                          .elevatedButtonTheme
                                          .style,
                                      child: const Iconoir(Iconoir.carbon,
                                          color: Colors.white)),
                                  Text("Безуглеродность",
                                      style:
                                          Theme.of(context).textTheme.bodyText1)
                                ]),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: height * 0.275,
                    width: width * 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5)),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            height: height * 0.275,
                            width: width * 0.3,
                            child: Center(
                              child: RadarChart.light(
                                ticks: ticks,
                                features: features,
                                data: data,
                                reverseAxis: false,
                                useSides: true,
                                // useSides: useSides,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.275,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text("Сравнительный анализ:",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Icon(Icons.horizontal_rule_outlined,
                                              color: defaultGraphColors[0]),
                                          Text("Сеть",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                              textAlign: TextAlign.left),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.horizontal_rule_outlined,
                                              color: defaultGraphColors[1]),
                                          Text("Накопители",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                              textAlign: TextAlign.left),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.horizontal_rule_outlined,
                                              color: defaultGraphColors[2]),
                                          Text("Электрокотельная",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                              textAlign: TextAlign.left),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.horizontal_rule_outlined,
                                              color: defaultGraphColors[3]),
                                          Text("Водород",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                              textAlign: TextAlign.left),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer()
                                ]),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
              height: height * 0.725,
              width: width,
              child: Column(children: <Widget>[
                SizedBox(
                  height: height * 0.18125,
                  width: width,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.18125,
                          width: width * 0.34,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 5)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Конфигурация: сеть",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(Icons.power_outlined),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text("500",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child:
                                                  Icon(Icons.factory_outlined),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("1",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("500",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(
                                                  Icons.wind_power_outlined),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(Icons
                                                  .battery_charging_full_outlined),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(MdiIcons.fuelCell),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Iconoir(Iconoir.hydrogen,
                                                  color: Colors.white),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                            height: height * 0.18125,
                            width: width * 0.65,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 5)),
                                child: Column()))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.18125,
                  width: width,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.18125,
                          width: width * 0.34,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.white, width: 5)),
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Конфигурация: сеть",
                                      style:
                                      Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(Icons.power_outlined),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text("500",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child:
                                              Icon(Icons.factory_outlined),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("1",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("500",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(
                                                  Icons.wind_power_outlined),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(Icons
                                                  .battery_charging_full_outlined),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(MdiIcons.fuelCell),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Iconoir(Iconoir.hydrogen,
                                                  color: Colors.white),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                            height: height * 0.18125,
                            width: width * 0.65,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 5)),
                                child: Column()))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.18125,
                  width: width,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.18125,
                          width: width * 0.34,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.white, width: 5)),
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Конфигурация: сеть",
                                      style:
                                      Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(Icons.power_outlined),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text("500",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child:
                                              Icon(Icons.factory_outlined),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("1",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("500",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(
                                                  Icons.wind_power_outlined),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(Icons
                                                  .battery_charging_full_outlined),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(MdiIcons.fuelCell),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Iconoir(Iconoir.hydrogen,
                                                  color: Colors.white),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                            height: height * 0.18125,
                            width: width * 0.65,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 5)),
                                child: Column()))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.18125,
                  width: width,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.18125,
                          width: width * 0.34,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.white, width: 5)),
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Конфигурация: сеть",
                                      style:
                                      Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.left),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(Icons.power_outlined),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text("500",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child:
                                              Icon(Icons.factory_outlined),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("1",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("500",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(
                                                  Icons.wind_power_outlined),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      width: width * 0.015,
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("0",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .bodyText1),
                                                      ),
                                                    ),
                                                    Text("X",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text("000",
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(Icons
                                                  .battery_charging_full_outlined),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Icon(MdiIcons.fuelCell),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.125,
                                        width: width * 0.05,
                                        child: Column(
                                          children: <Widget>[
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Iconoir(Iconoir.hydrogen,
                                                  color: Colors.white),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                children: [
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  Icon(
                                                      Icons
                                                          .horizontal_rule_outlined,
                                                      color: Common.textColor),
                                                  Text("100",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                            height: height * 0.18125,
                            width: width * 0.65,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 5)),
                                child: Column()))
                      ],
                    ),
                  ),
                ),
              ]))])));
  }
}
