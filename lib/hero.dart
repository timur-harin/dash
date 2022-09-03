
import 'package:flutter/material.dart';

import 'package:dash/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HeroPage extends StatefulWidget {
  int tapIndex;
  List<List<TableData>> data;
  String title;

  HeroPage({super.key, required this.tapIndex, required this.data, required this.title});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  var height = WidgetsBinding.instance.window.physicalSize.height;
  var width = WidgetsBinding.instance.window.physicalSize.width;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  double heightAppBar = 80;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height - heightAppBar;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_outlined, size: 40, color: Colors.black,), onPressed: () {  Navigator.pop(context); }),
        actions: [SizedBox(height: 60, child: Image.asset("assets/icons/rushydro.jpeg"))],
        elevation: 0,
        toolbarHeight: heightAppBar,
        centerTitle: true,
        title: FittedBox(fit: BoxFit.fitWidth, child: Text(widget.title)),
      ),
      body: Center(
          child: Hero(
            tag: 'imageHero',
            child: SfCartesianChart(
              palette: const [Color.fromRGBO(75, 134, 185, 1), Colors.grey, greenButton, Colors.pinkAccent, Colors.lightBlueAccent, Color.fromRGBO(168, 50, 48, 1)],
              legend: Legend(
                isVisible: true,
                orientation: LegendItemOrientation.horizontal,
                position: LegendPosition.top,
                height: '50%',
                  width: '70%',
                  iconHeight: height/1000*40,
                iconWidth: width/1920*40,
                  textStyle: Theme.of(context).textTheme.displayMedium
              ),
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[
                StackedAreaSeries<TableData, String>(
                  dataSource: widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.grid,
                  name: 'Сеть',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                StackedAreaSeries<TableData, String>(
                  dataSource: widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.diesel,
                  name: 'Дизель-генераторы',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                StackedAreaSeries<TableData, String>(
                  dataSource: widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.wind,
                  name: 'Ветрогенераторы',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                StackedAreaSeries<TableData, String>(
                  dataSource: widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.ess,
                  name: 'Накопитель',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                StackedAreaSeries<TableData, String>(
                  dataSource: widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.hydrogen,
                  name: 'Водород',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                SplineAreaSeries<TableData, String>(
                  dataSource: widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.thermal,
                  name: 'Теплонакопитель',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
              ],
              primaryXAxis: CategoryAxis(labelStyle: Theme.of(context).textTheme.displayMedium),
              primaryYAxis: CategoryAxis(labelStyle: Theme.of(context).textTheme.displayMedium),
            ),
          ),
        ),
      );
  }
}
