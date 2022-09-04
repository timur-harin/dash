import 'package:flutter/material.dart';

import 'package:dash/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
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
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  double heightAppBar = 80;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height - heightAppBar;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
                icon: const Icon(
                  Icons.cancel,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
        elevation: 0,
        toolbarHeight: heightAppBar,
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(
              height: 80,
              child: MaterialButton(child: Image.asset('assets/icons/rushydro.jpeg', fit: BoxFit.scaleDown), onPressed: () {}),
            ),
            FittedBox(fit: BoxFit.fitWidth, child: Text(widget.title)),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SizedBox(height: height / 1000 * 100, child: Text(confNames[widget.tapIndex].toString(), style: Theme.of(context).textTheme.titleLarge)),
            const Spacer(),
            SizedBox(
              height: height / 1000 * 800,
              child: Hero(
                tag: 'imageHero',
                child: SfCartesianChart(
              palette: const [
              Color.fromRGBO(109, 109, 109, 1),
              Color.fromRGBO(252, 239, 122, 1),
              Color.fromRGBO(135, 221, 121, 1),
              Color.fromRGBO(44, 83, 160, 1),
              Color.fromRGBO(44, 83, 160, 1),
              Color.fromRGBO(249, 148, 147, 1),
              Color.fromRGBO(249, 148, 147, 1),
              Color.fromRGBO(152, 234, 229, 1),
              Color.fromRGBO(152, 234, 229, 1)
              ],
              legend: Legend(
                  isVisible: true, orientation: LegendItemOrientation.horizontal, position: LegendPosition.top, textStyle: const TextStyle(fontSize: 16)),
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
                  dataSource:  widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.diesel,
                  name: 'Дизель-генераторы',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                StackedAreaSeries<TableData, String>(
                  dataSource:  widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.wind,
                  name: 'Ветрогенераторы',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                SplineAreaSeries<TableData, String>(
                  dataSource:  widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.ess_,
                  name: 'Накопитель(зарядка)',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                StackedAreaSeries<TableData, String>(
                  dataSource:  widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.ess,
                  name: 'Накопитель(выдача)',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                SplineAreaSeries<TableData, String>(
                  dataSource:  widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.thermal_,
                  name: 'Теплонакопитель(зарядка)',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                StackedAreaSeries<TableData, String>(
                  dataSource:  widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.thermal,
                  name: 'Теплонакопитель(выдача)',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                SplineAreaSeries<TableData, String>(
                  dataSource:  widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.hydrogen_,
                  name: 'Водород(накопление)',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
                StackedAreaSeries<TableData, String>(
                  dataSource:  widget.data.elementAt(widget.tapIndex),
                  xValueMapper: (TableData exp, _) => exp.time,
                  yValueMapper: (TableData exp, _) => exp.hydrogen,
                  name: 'Водород(выдача)',
                  // markerSettings: MarkerSettings(
                  //   isVisible: true,
                  // )
                ),
              ],
              primaryXAxis: CategoryAxis(),
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
