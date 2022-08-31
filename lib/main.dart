import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:dash/data.dart';
import 'package:dash/theme.dart';
import 'package:dash/common.dart';

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
      home: MainPage(title: 'Цифровая модель управления энергетической гибкостью'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late List<int> items = [0, 1, 2, 3];
  double heightAppBar = 80;
  double _value = 100.0;
  var size = window.physicalSize;
  var height = WidgetsBinding.instance.window.physicalSize.height;
  var width = WidgetsBinding.instance.window.physicalSize.width;

  late List<TableData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  List<TableData> getChartData() {
    List<TableData> chartData = [];
    for (var i = 0; i < 24; i++) {
      var f = TableData("${i + 1}:00", g100Grid[i], g100Deisel1[i] + g100Diesel2[i], g100Wind1[i] + g100Wind2[i], g100Ess[i], g100Thermal[i], g100Hydrogen[i]);
      chartData.add(f);
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

      final List<int> configuration2 = configuration.removeAt(oldIndex);
      configuration.insert(newIndex, configuration2);

      final String newTitle = confNames.removeAt(oldIndex);
      confNames.insert(newIndex, newTitle);

      print(items);
    });
  }

  void reinit() {
    items = [0, 1, 2, 3];
    configuration = [electroConfiguration, storageConfiguration, boilerConfiguration, hydrogenConfiguration];
    menuColors = [greyMenu, blueMenu, orangeMenu, azureMenu];
    confNames = [confElectro, confBattery, confBoiled, congHydro];
  }

  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: true);
  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.easeIn,
  // );
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
          title: Text(widget.title),
        ),
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
                          Text("Спрос на мощность (кВт)", style: Theme.of(context).textTheme.headline6),
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
                                  });
                                },
                              ),
                            ),
                          ),
                          Text("Критерии оптимизации", style: Theme.of(context).textTheme.headline6),
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
                                      reinit();
                                      reorder(0, 4);
                                      reorder(0, 2);
                                      // initTableData(); //TODO change init function
                                    },
                                    style: commonTheme().elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => yellowButton)),
                                    child: Text("Экономичность", style: Theme.of(context).textTheme.headline4),
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
                                          reinit();
                                          reorder(0, 4);
                                        },
                                        style: commonTheme().elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => blueButton)),
                                        child: Text("Надежность", style: Theme.of(context).textTheme.headline4))),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 20, 15, 25),
                                child: SizedBox(
                                    height: height / 1000 * 80,
                                    width: width / 1920 * 370,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          reinit();
                                          reorder(0, 4);
                                          reorder(1, 3);
                                          reorder(0, 2);
                                        },
                                        style:
                                            commonTheme().elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => greenButton)),
                                        child: Text("Безуглеродность", style: Theme.of(context).textTheme.headline4))),
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
                      Text("Сравнительный анализ:", style: Theme.of(context).textTheme.headline6),
                      Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                          child: SizedBox(
                            height: height / 1000 * 210,
                            width: width / 1920 * 300,
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
                                  Row(
                                    children: [
                                      Icon(Icons.horizontal_rule_outlined, color: customColors[0]),
                                      Text("Сеть", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.horizontal_rule_outlined, color: customColors[1]),
                                      Text("Накопители", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.horizontal_rule_outlined, color: customColors[2]),
                                      Text("Электрокотельная", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.horizontal_rule_outlined, color: customColors[3]),
                                      Text("Водород", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left),
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
            // child: FadeTransition(
            //   opacity: _animation,
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

                    final List<int> configuration2 = configuration.removeAt(oldIndex);
                    configuration.insert(newIndex, configuration2);

                    final String newTitle = confNames.removeAt(oldIndex);
                    confNames.insert(newIndex, newTitle);

                    print(items);
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
                                  Text(confNames[index], style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.left),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        height: height / 1000 * 100,
                                        width: width / 1920 * 75,
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset("assets/icons/lep.svg", width: 16, height: 30, fit: BoxFit.scaleDown),
                                                  Text(" Сеть", style: Theme.of(context).textTheme.subtitle1)
                                                ],
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(configuration[index][0].toString(), style: Theme.of(context).textTheme.bodyText2),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 1000 * 100,
                                        width: width / 1920 * 135,
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset("assets/icons/dyzel.svg", width: 42, height: 30, fit: BoxFit.scaleDown),
                                                  Text(" ДГУ", style: Theme.of(context).textTheme.subtitle1)
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][1].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                  const Text("X", style: TextStyle(fontWeight: FontWeight.w600)),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][2].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][3].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                  const Text("X", style: TextStyle(fontWeight: FontWeight.w600)),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][4].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 1000 * 100,
                                        width: width / 1920 * 135,
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset("assets/icons/wind.svg", width: 23, height: 30, fit: BoxFit.scaleDown),
                                                  Text(" ВЭУ", style: Theme.of(context).textTheme.subtitle1)
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][5].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                  const Text("X", style: TextStyle(fontWeight: FontWeight.w600)),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][6].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][7].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                  const Text("X", style: TextStyle(fontWeight: FontWeight.w600)),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][8].toString(), style: Theme.of(context).textTheme.bodyText2),
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
                                                  SvgPicture.asset("assets/icons/battery.svg", width: 15, height: 30, fit: BoxFit.scaleDown),
                                                  Text(" CНЭ", style: Theme.of(context).textTheme.subtitle1)
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][9].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][10].toString(), style: Theme.of(context).textTheme.bodyText2),
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
                                                  Text(" ТА", style: Theme.of(context).textTheme.subtitle1)
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][11].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][12].toString(), style: Theme.of(context).textTheme.bodyText2),
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
                                                  Text(" ТЭ", style: Theme.of(context).textTheme.subtitle1)
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][13].toString(), style: Theme.of(context).textTheme.bodyText2),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text(configuration[index][14].toString(), style: Theme.of(context).textTheme.bodyText2),
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
                                    legend: Legend(isVisible: true, orientation: LegendItemOrientation.horizontal, position: LegendPosition.top),
                                    tooltipBehavior: _tooltipBehavior,
                                    series: <ChartSeries>[
                                      StackedAreaSeries<TableData, String>(
                                        dataSource: _chartData,
                                        xValueMapper: (TableData exp, _) => exp.time,
                                        yValueMapper: (TableData exp, _) => exp.grid,
                                        name: 'Сеть',
                                        // markerSettings: MarkerSettings(
                                        //   isVisible: true,
                                        // )
                                      ),
                                      StackedAreaSeries<TableData, String>(
                                        dataSource: _chartData,
                                        xValueMapper: (TableData exp, _) => exp.time,
                                        yValueMapper: (TableData exp, _) => exp.diesel,
                                        name: 'Дизель-генераторы',
                                        // markerSettings: MarkerSettings(
                                        //   isVisible: true,
                                        // )
                                      ),
                                      StackedAreaSeries<TableData, String>(
                                        dataSource: _chartData,
                                        xValueMapper: (TableData exp, _) => exp.time,
                                        yValueMapper: (TableData exp, _) => exp.wind,
                                        name: 'Ветрогенераторы',
                                        // markerSettings: MarkerSettings(
                                        //   isVisible: true,
                                        // )
                                      ),
                                      StackedAreaSeries<TableData, String>(
                                        dataSource: _chartData,
                                        xValueMapper: (TableData exp, _) => exp.time,
                                        yValueMapper: (TableData exp, _) => exp.ess,
                                        name: 'СНЭ',
                                        // markerSettings: MarkerSettings(
                                        //   isVisible: true,
                                        // )
                                      ),
                                      StackedAreaSeries<TableData, String>(
                                        dataSource: _chartData,
                                        xValueMapper: (TableData exp, _) => exp.time,
                                        yValueMapper: (TableData exp, _) => exp.hydrogen,
                                        name: 'Водород',
                                        // markerSettings: MarkerSettings(
                                        //   isVisible: true,
                                        // )
                                      ),
                                      StackedAreaSeries<TableData, String>(
                                        dataSource: _chartData,
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
          )
        ])));
  }
}
