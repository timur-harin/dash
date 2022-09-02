import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:dash/data.dart';
import 'package:dash/theme.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
      home: const MainPage(title: 'Цифровая модель управления энергетической гибкостью в с. Новиково'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late List<int> items = [0, 1, 2, 3];
  double heightAppBar = 80;
  int _index = 0;
  double _value = 100.0;
  var size = window.physicalSize;
  var height = WidgetsBinding.instance.window.physicalSize.height;
  var width = WidgetsBinding.instance.window.physicalSize.width;

  late List<List<TableData>> _chartData;
  late TooltipBehavior _tooltipBehavior;

  double _opacity = 1;

  @override
  void initState() {
    _chartData = getChartData(_index);
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  List<List<TableData>> getChartData(int index) {
    List<List<TableData>> chartData = [];
    for (var iconf = 0; iconf < 4; iconf++) {
      List<TableData> table = [];
      for (var i = 0; i < 24; i++) {
        TableData f = TableData("${i + 1}:00", dataT[iconf][index][0][i], dataT[iconf][index][1][i], dataT[iconf][index][2][i], dataT[iconf][index][3][i],
            dataT[iconf][index][4][i], dataT[iconf][index][5][i]);
        table.add(f);
      }
      chartData.add(table);
    }

    return chartData;
  }

  void reorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final int item = items.removeAt(oldIndex);
      items.insert(newIndex, item);

      final Color menuColor = menuColors.removeAt(oldIndex);
      menuColors.insert(newIndex, menuColor);

      final List<List<int>> configuration2 = conf.removeAt(oldIndex);
      conf.insert(newIndex, configuration2);

      final List<TableData> chartData2 = _chartData.removeAt(oldIndex);
      _chartData.insert(newIndex, chartData2);

      final String newTitle = confNames.removeAt(oldIndex);
      confNames.insert(newIndex, newTitle);
    });
  }

  void reInit() {
    items = [0, 1, 2, 3];
    conf = [gConf, sConf, tConf, hConf];
    menuColors = [greyMenu, blueMenu, orangeMenu, azureMenu];
    confNames = [confElectro, confBattery, confBoiled, congHydro];
    _chartData = getChartData(_index);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height - heightAppBar;
    width = size.width;

    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
            actions: [SizedBox(height: 60, child: Image.asset("assets/icons/rushydro.jpeg"))],
            elevation: 0,
            toolbarHeight: heightAppBar,
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(widget.title),
            )),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
            height: height * 0.287,
            width: width,
            child: Row(children: <Widget>[
              Center(
                child: SizedBox(
                  height: height * 0.287,
                  width: width * 0.633,
                  child: Container(
                    decoration: const BoxDecoration(border: Border(left: BorderSide(width: 20, color: Colors.white), right: BorderSide(width: 5, color: Colors.white))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FittedBox(fit: BoxFit.scaleDown, child: Text("Спрос на мощность (кВт)", style: Theme.of(context).textTheme.displayLarge)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: SizedBox(
                              width: width / 1920 * 1150,
                              height: height / 1000 * 50,
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
                                    _index = (_value ~/ 100) - 1;
                                    _chartData = getChartData(_index);
                                  });
                                },
                              ),
                            ),
                          ),
                          FittedBox(fit: BoxFit.scaleDown, child: Text("Критерии оптимизации", style: Theme.of(context).textTheme.displayLarge)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 20, 10, 25),
                                child: SizedBox(
                                  height: height / 1000 * 80,
                                  width: width / 1920 * 370,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _opacity = 0;
                                      });
                                      Future.delayed(
                                          const Duration(seconds: 1),
                                          () => setState(() {
                                                reInit();
                                                reorder(0, 4);
                                                reorder(0, 2);
                                                _opacity = 1;
                                              }));
                                    },
                                    style: commonTheme().elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => yellowButton)),
                                    child: FittedBox(fit: BoxFit.scaleDown, child: Text("Экономичность", style: Theme.of(context).textTheme.displayMedium)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 20, 10, 25),
                                child: SizedBox(
                                    height: height / 1000 * 80,
                                    width: width / 1920 * 370,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _opacity = 0;
                                          });
                                          Future.delayed(
                                              const Duration(seconds: 1),
                                              () => setState(() {
                                                    reInit();
                                                    reorder(0, 4);
                                                    _opacity = 1;
                                                  }));
                                        },
                                        style: commonTheme().elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => blueButton)),
                                        child: FittedBox(fit: BoxFit.scaleDown, child: Text("Надежность", style: Theme.of(context).textTheme.displayMedium)))),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 20, 15, 25),
                                child: SizedBox(
                                    height: height / 1000 * 80,
                                    width: width / 1920 * 370,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _opacity = 0;
                                          });
                                          Future.delayed(
                                              const Duration(seconds: 1),
                                              () => setState(() {
                                                    reInit();
                                                    reorder(0, 4);
                                                    reorder(1, 3);
                                                    reorder(0, 2);
                                                    _opacity = 1;
                                                  }));
                                        },
                                        style:
                                            commonTheme().elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => greenButton)),
                                        child: FittedBox(fit: BoxFit.scaleDown, child: Text("Безуглеродность", style: Theme.of(context).textTheme.displayMedium)))),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.287,
                width: width * 0.367,
                child: Container(
                  decoration: const BoxDecoration(border: Border(left: BorderSide(width: 5, color: Colors.white), right: BorderSide(width: 20, color: Colors.white))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(fit: BoxFit.scaleDown, child: Text("Сравнительный анализ:", style: Theme.of(context).textTheme.displayLarge)),
                      Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                          child: SizedBox(
                            height: height / 1000 * 210,
                            width: width / 1920 * 300,
                            child: Center(
                              child: RadarChart(
                                ticks: ticks,
                                features: features,
                                data: data[_index],
                                reverseAxis: false,
                                sides: 3,
                                graphColors: const [Colors.black54, Colors.blueAccent, Colors.orange, Colors.green],
                                // outlineColor: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: SizedBox(
                            height: height / 1000 * 210,
                            width: width / 1920 * 300,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  const Icon(Icons.horizontal_rule_outlined, color: Color.fromRGBO(0, 0, 0, 0)),
                                  Row(
                                    children: [
                                      Icon(Icons.horizontal_rule_outlined, color: customColors[0]),
                                      Flexible(child: Text("Строительство сети", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.left)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.horizontal_rule_outlined, color: customColors[1]),
                                      Flexible(child: Text("Установка литий-ионного накопителя", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.left)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.horizontal_rule_outlined, color: customColors[2]),
                                      Flexible(child: Text("Переход на электроотопление", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.left)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.horizontal_rule_outlined, color: customColors[3]),
                                      Flexible(child: Text("Установка водородного накопителя", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.left)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
              height: height * 0.71,
              width: width,
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 1),

                child: ReorderableListView(
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final int item = items.removeAt(oldIndex);
                        items.insert(newIndex, item);

                        final Color menuColor = menuColors.removeAt(oldIndex);
                        menuColors.insert(newIndex, menuColor);

                        final List<List<int>> configuration2 = conf.removeAt(oldIndex);
                        conf.insert(newIndex, configuration2);

                        final List<TableData> chartData2 = _chartData.removeAt(oldIndex);
                        _chartData.insert(newIndex, chartData2);

                        final String newTitle = confNames.removeAt(oldIndex);
                        confNames.insert(newIndex, newTitle);
                      });
                    },
                    children: <Widget>[
                      for (int index = 0; index < items.length; index += 1)
                        SizedBox(
                          key: Key('$index'),
                          height: height * 0.175,
                          width: width,
                          child: Container(
                            color: menuColors[index],
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  height: height * 0.175,
                                  width: width * 0.326,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            left: BorderSide(width: 20, color: Colors.white),
                                            top: BorderSide(width: 10, color: Colors.white),
                                            right: BorderSide(width: 5, color: Colors.white),
                                            bottom: BorderSide(width: 5, color: Colors.white))),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                                      Text(confNames[index], style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.left),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          SizedBox(
                                            height: height / 1000 * 100,
                                            width: width / 1920 * 75,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Center(
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset("assets/icons/lep.svg", width: 16, height: 30, fit: BoxFit.scaleDown),
                                                        Text(" Сеть", style: Theme.of(context).textTheme.headlineSmall)
                                                      ],
                                                    ),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text(conf[index][_index][0].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 1000 * 100,
                                            width: width / 1920 * 135,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Center(
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset("assets/icons/dyzel.svg", width: 42, height: 30, fit: BoxFit.scaleDown),
                                                        Text(" ДГУ", style: Theme.of(context).textTheme.headlineSmall)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(conf[index][_index][1].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                        ),
                                                        const Text("X", style: TextStyle(fontWeight: FontWeight.w600)),
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(conf[index][_index][2].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 1000 * 100,
                                            width: width / 1920 * 135,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Center(
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset("assets/icons/wind.svg", width: 23, height: 30, fit: BoxFit.scaleDown),
                                                        Text(" ВЭУ", style: Theme.of(context).textTheme.headlineSmall)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(conf[index][_index][3].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                        ),
                                                        const Text("X", style: TextStyle(fontWeight: FontWeight.w600)),
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(conf[index][_index][4].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 1000 * 100,
                                            width: width / 1920 * 75,
                                            child: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset("assets/icons/battery.svg", width: 15, height: 30, fit: BoxFit.scaleDown),
                                                      Text(" CНЭ", style: Theme.of(context).textTheme.headlineSmall)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: Text(conf[index][_index][5].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: Text(conf[index][_index][6].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 1000 * 100,
                                            width: width / 1920 * 75,
                                            child: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset("assets/icons/thermal.svg", width: 38, height: 30, fit: BoxFit.scaleDown),
                                                      Text(" ТА", style: Theme.of(context).textTheme.headlineSmall)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: Text(conf[index][_index][7].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: Text(conf[index][_index][8].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height / 1000 * 100,
                                            width: width / 1920 * 75,
                                            child: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset("assets/icons/hydrogen.svg", width: 15, height: 30, fit: BoxFit.scaleDown),
                                                      Text(" ТЭ", style: Theme.of(context).textTheme.headlineSmall)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: Text(conf[index][_index][9].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: Text(conf[index][_index][10].toString(), style: Theme.of(context).textTheme.headlineMedium),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                    height: height * 0.175,
                                    width: width * 0.674,
                                    child: Container(
                                      // color: ,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              left: BorderSide(width: 5, color: Colors.white),
                                              top: BorderSide(width: 10, color: Colors.white),
                                              right: BorderSide(width: 20, color: Colors.white),
                                              bottom: BorderSide(width: 5, color: Colors.white))),
                                      child: SfCartesianChart(
                                        palette: const [
                                          Color.fromRGBO(75, 134, 185, 1),
                                          Colors.grey,
                                          greenButton,
                                          Colors.pinkAccent,
                                          Colors.lightBlueAccent,
                                          Color.fromRGBO(168, 50, 48, 1)
                                        ],
                                        legend: Legend(isVisible: true, orientation: LegendItemOrientation.horizontal, position: LegendPosition.top),
                                        tooltipBehavior: _tooltipBehavior,
                                        series: <ChartSeries>[
                                          StackedAreaSeries<TableData, String>(
                                            dataSource: _chartData[index],
                                            xValueMapper: (TableData exp, _) => exp.time,
                                            yValueMapper: (TableData exp, _) => exp.grid,
                                            name: 'Сеть',
                                            // markerSettings: MarkerSettings(
                                            //   isVisible: true,
                                            // )
                                          ),
                                          StackedAreaSeries<TableData, String>(
                                            dataSource: _chartData[index],
                                            xValueMapper: (TableData exp, _) => exp.time,
                                            yValueMapper: (TableData exp, _) => exp.diesel,
                                            name: 'Дизель-генераторы',
                                            // markerSettings: MarkerSettings(
                                            //   isVisible: true,
                                            // )
                                          ),
                                          StackedAreaSeries<TableData, String>(
                                            dataSource: _chartData[index],
                                            xValueMapper: (TableData exp, _) => exp.time,
                                            yValueMapper: (TableData exp, _) => exp.wind,
                                            name: 'Ветрогенераторы',
                                            // markerSettings: MarkerSettings(
                                            //   isVisible: true,
                                            // )
                                          ),
                                          StackedAreaSeries<TableData, String>(
                                            dataSource: _chartData[index],
                                            xValueMapper: (TableData exp, _) => exp.time,
                                            yValueMapper: (TableData exp, _) => exp.ess,
                                            name: 'Накопитель',
                                            // markerSettings: MarkerSettings(
                                            //   isVisible: true,
                                            // )
                                          ),
                                          StackedAreaSeries<TableData, String>(
                                            dataSource: _chartData[index],
                                            xValueMapper: (TableData exp, _) => exp.time,
                                            yValueMapper: (TableData exp, _) => exp.hydrogen,
                                            name: 'Водород',
                                            // markerSettings: MarkerSettings(
                                            //   isVisible: true,
                                            // )
                                          ),
                                          SplineAreaSeries<TableData, String>(
                                            dataSource: _chartData[index],
                                            xValueMapper: (TableData exp, _) => exp.time,
                                            yValueMapper: (TableData exp, _) => exp.thermal,
                                            name: 'Теплонакопитель',
                                            // markerSettings: MarkerSettings(
                                            //   isVisible: true,
                                            // )
                                          ),
                                        ],
                                        primaryXAxis: CategoryAxis(),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                    ]),
                // )
              ))
        ])));
  }
}
