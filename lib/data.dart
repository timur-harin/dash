import 'package:flutter/material.dart';

class TableData {
  TableData(this.time, this.grid, this.diesel, this.wind, this.ess, this.thermal, this.hydrogen);
  final String time;
  final int grid;
  final int diesel;
  final int wind;
  final int ess;
  final int thermal;
  final int hydrogen;
}

final List<int> g100Grid = [100, 344, 307, 179, 213, 206, 304, 212, 233, 308, 220, 224, 294, 328, 307, 221, 266, 267, 329, 240, 204, 346, 182, 222];
final List<int> g100Deisel1 = [54, 304, 312, 193, 236, 219, 243, 237, 277, 285, 274, 234, 345, 339, 323, 210, 293, 253, 275, 305, 252, 360, 245, 259];
final List<int> g100Diesel2 = [129, 343, 347, 222, 205, 260, 230, 230, 308, 211, 268, 172, 361, 411, 375, 167, 254, 252, 301, 285, 224, 398, 193, 230];
final List<int> g100Wind1 = [61, 390, 298, 226, 238, 245, 155, 224, 295, 212, 293, 217, 317, 430, 396, 127, 206, 292, 276, 234, 157, 345, 259, 231];
final List<int> g100Wind2 = [110, 449, 255, 282, 214, 313, 226, 206, 294, 173, 301, 237, 357, 408, 333, 83, 191, 247, 307, 203, 210, 336, 294, 302];
final List<int> g100Ess = [169, 322, 286, 317, 304, 111, 146, -107, 236, -88, 334, 120, 113, 389, 97, 210, 158, 89, -18, -117, 69, 254, 192, -51];
final List<int> g100Thermal = [-112, -252, -346, -358, -282, -120, -82, -146, -222, -46, -389, -125, -139, -461, -87, -204, -189, -135, -18, -127, -12, -292, -140, -51];
final List<int> g100Hydrogen = [169, 322, 286, 317, 304, 111, 146, -107, 236, -88, 334, 120, 113, 389, 97, 210, 158, 89, -18, -117, 69, 254, 192, -51];

final List<int> electroConfiguration = [500, 1, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> storageConfiguration = [0, 1, 100, 1, 200, 1, 225, 0, 0, 100, 200, 0, 0, 0, 0];
final List<int> boilerConfiguration = [0, 2, 200, 0, 0, 2, 225, 0, 0, 100, 100, 100, 400, 0, 0];
final List<int> hydrogenConfiguration = [0, 2, 200, 0, 0, 2, 225, 0, 0, 50, 50, 0, 0, 100, 800];

var configuration = [electroConfiguration, storageConfiguration, boilerConfiguration, hydrogenConfiguration];

const ticks = [1, 2, 3, 4, 5];
var features = ["Экономичность", "Надежность", "Безуглеродность"];
const data = [
  [5, 2, 4],
  [3, 1, 5],
  [3, 4, 1],
  [2, 3, 3]
];
const customColors = [
  Colors.green,
  Colors.blue,
  Colors.red,
  Colors.orange,
];
