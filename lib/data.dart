import 'package:flutter/material.dart';
import 'package:led_bulb_indicator/led_bulb_indicator.dart';

class TableData {
  TableData(this.time, this.grid, this.diesel, this.wind, this.ess_, this.ess, this.thermal_, this.thermal, this.hydrogen_, this.hydrogen);
  final String time;
  final int grid;
  final int diesel;
  final int wind;
  final int ess_;
  final int ess;
  final int thermal_;
  final int thermal;
  final int hydrogen_;
  final int hydrogen;
}

final List<int> g100Grid = [60, 55, 51, 51, 51, 60, 63, 62, 75, 77, 88, 82, 88, 81, 82, 80, 82, 86, 100, 99, 99, 84, 74, 67];
final List<int> g100Diesel = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g100Wind = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g100Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g100Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g100Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g100Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g100Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g100Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var g100 = [g100Grid, g100Diesel, g100Wind, g100Ess_, g100Ess, g100Thermal_, g100Thermal, g100Hydrogen_, g100Hydrogen];

final List<int> g200Grid = [121, 110, 101, 101, 101, 121, 126, 125, 151, 155, 175, 164, 175, 162, 164, 160, 164, 173, 200, 197, 197, 167, 148, 134];
final List<int> g200Diesel = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g200Wind = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g200Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g200Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g200Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g200Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g200Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g200Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var g200 = [g200Grid, g200Diesel, g200Wind, g200Ess_, g200Ess, g200Thermal_, g200Thermal, g200Hydrogen_, g200Hydrogen];

final List<int> g300Grid = [181, 164, 152, 152, 152, 181, 189, 187, 226, 232, 263, 247, 263, 242, 247, 240, 247, 259, 300, 296, 296, 251, 222, 201];
final List<int> g300Diesel = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g300Wind = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g300Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g300Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g300Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g300Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g300Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g300Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var g300 = [
  g300Grid,
  g300Diesel,
  g300Wind,
  g300Ess_,
  g300Ess,
  g300Thermal_,
  g300Thermal,
  g300Hydrogen_,
  g300Hydrogen,
];

final List<int> g400Grid = [241, 219, 203, 203, 203, 241, 252, 249, 301, 310, 351, 329, 351, 323, 329, 321, 329, 345, 400, 395, 395, 334, 296, 268];
final List<int> g400Diesel = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g400Wind = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g400Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g400Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g400Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g400Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

final List<int> g400Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g400Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var g400 = [g400Grid, g400Diesel, g400Wind, g400Ess_, g400Ess, g400Thermal_, g400Thermal, g400Hydrogen_, g400Hydrogen];

final List<int> g500Grid = [301, 274, 253, 253, 253, 301, 315, 312, 377, 387, 438, 411, 438, 404, 411, 401, 411, 432, 500, 493, 493, 418, 370, 336];
final List<int> g500Diesel = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g500Wind = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g500Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g500Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g500Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g500Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g500Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> g500Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var g500 = [g500Grid, g500Diesel, g500Wind, g500Ess_, g500Ess, g500Thermal_, g500Thermal, g500Hydrogen_, g500Hydrogen];

var gData = [g100, g200, g300, g400, g500];

final List<int> s100Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s100Diesel = [37, 35, 35, 35, 35, 35, 35, 35, 46, 49, 49, 49, 49, 40, 37, 35, 35, 41, 49, 49, 49, 49, 49, 46];
final List<int> s100Wind = [23, 26, 28, 29, 31, 32, 32, 31, 29, 27, 29, 31, 35, 41, 46, 49, 48, 45, 42, 38, 33, 29, 25, 21];
final List<int> s100Ess_ = [0, -6, -12, -13, -15, -6, -4, -3, 0, 0, 0, 0, 0, 0, 0, -3, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s100Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 10, 2, 3, 0, 0, 0, 0, 0, 9, 11, 17, 5, 0, 0];
final List<int> s100Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s100Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s100Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s100Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var s100 = [s100Grid, s100Diesel, s100Wind, s100Ess_, s100Ess, s100Thermal_, s100Thermal, s100Hydrogen_, s100Hydrogen];

final List<int> s200Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s200Diesel = [97, 90, 90, 90, 90, 90, 94, 94, 122, 128, 143, 133, 140, 121, 119, 112, 117, 127, 143, 143, 143, 138, 123, 114];
final List<int> s200Wind = [23, 26, 28, 29, 31, 32, 32, 31, 29, 27, 29, 31, 35, 41, 46, 49, 48, 45, 42, 38, 33, 29, 25, 21];
final List<int> s200Ess_ = [0, -6, -17, -18, -20, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s200Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 16, 17, 22, 0, 0, 0];
final List<int> s200Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s200Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s200Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s200Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var s200 = [s200Grid, s200Diesel, s200Wind, s200Ess_, s200Ess, s200Thermal_, s200Thermal, s200Hydrogen_, s200Hydrogen];

final List<int> s300Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s300Diesel = [163, 163, 163, 163, 163, 163, 163, 163, 197, 205, 221, 216, 221, 202, 201, 192, 199, 214, 221, 221, 221, 221, 197, 181];
final List<int> s300Wind = [23, 26, 28, 29, 31, 32, 32, 31, 29, 27, 29, 31, 35, 41, 46, 49, 48, 45, 42, 38, 33, 29, 25, 21];
final List<int> s300Ess_ = [-6, -25, -40, -40, -42, -14, -6, -7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s300Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 6, 0, 0, 0, 0, 0, 37, 37, 42, 0, 0, 0];
final List<int> s300Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s300Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s300Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s300Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var s300 = [s300Grid, s300Diesel, s300Wind, s300Ess_, s300Ess, s300Thermal_, s300Thermal, s300Hydrogen_, s300Hydrogen];

final List<int> s400Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s400Diesel = [220, 220, 220, 220, 220, 220, 220, 220, 272, 283, 316, 298, 315, 283, 283, 272, 281, 300, 316, 316, 316, 305, 271, 248];
final List<int> s400Wind = [23, 26, 28, 29, 31, 32, 32, 31, 29, 27, 29, 31, 35, 41, 46, 49, 48, 45, 42, 38, 33, 29, 25, 21];
final List<int> s400Ess_ = [-2, -27, -45, -46, -48, -10, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s400Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 42, 41, 46, 0, 0, 0];
final List<int> s400Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s400Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s400Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s400Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var s400 = [s400Grid, s400Diesel, s400Wind, s400Ess_, s400Ess, s400Thermal_, s400Thermal, s400Hydrogen_, s400Hydrogen];

final List<int> s500Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s500Diesel = [278, 274, 274, 274, 274, 274, 283, 281, 348, 360, 410, 380, 403, 364, 365, 352, 363, 386, 413, 413, 413, 389, 345, 315];
final List<int> s500Wind = [23, 26, 28, 29, 31, 32, 32, 31, 29, 27, 29, 31, 35, 41, 46, 49, 48, 45, 42, 38, 33, 29, 25, 21];
final List<int> s500Ess_ = [0, -26, -49, -50, -51, -4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s500Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, 42, 48, 0, 0, 0];
final List<int> s500Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s500Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s500Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> s500Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var s500 = [s500Grid, s500Diesel, s500Wind, s500Ess_, s500Ess, s500Thermal_, s500Thermal, s500Hydrogen_, s500Hydrogen];

var sData = [s100, s200, s300, s400, s500];

final List<int> t100Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t100Diesel = [60, 55, 51, 51, 51, 60, 63, 62, 75, 77, 88, 82, 88, 81, 82, 80, 82, 86, 100, 99, 99, 84, 74, 67];
final List<int> t100Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> t100Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t100Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t100Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, -54, -57, -61, -68, -77, -87, -93, -91, -86, -80, 0, 0, 0, -51, 0];
final List<int> t100Thermal = [50, 53, 58, 60, 63, 65, 66, 62, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 66, 58, 0, 44];
final List<int> t100Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t100Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var t100 = [t100Grid, t100Diesel, t100Wind, t100Ess_, t100Ess, t100Thermal_, t100Thermal, t100Hydrogen_, t100Hydrogen];

final List<int> t200Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t200Diesel = [121, 110, 101, 101, 101, 121, 126, 125, 151, 155, 175, 164, 175, 162, 164, 160, 164, 173, 200, 197, 197, 167, 148, 134];
final List<int> t200Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> t200Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t200Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t200Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, -54, -57, -61, -68, -77, -87, -93, -91, -86, -80, 0, 0, 0, -51, 0];
final List<int> t200Thermal = [50, 53, 58, 60, 63, 65, 66, 62, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 66, 58, 0, 44];
final List<int> t200Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t200Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var t200 = [t200Grid, t200Diesel, t200Wind, t200Ess_, t200Ess, t200Thermal_, t200Thermal, t200Hydrogen_, t200Hydrogen];

final List<int> t300Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t300Diesel = [181, 164, 152, 152, 152, 181, 189, 187, 226, 232, 263, 247, 263, 242, 247, 240, 247, 259, 300, 296, 296, 251, 222, 201];
final List<int> t300Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> t300Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t300Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t300Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, -54, -57, -61, -68, -77, -87, -93, -91, -86, -80, 0, 0, 0, -51, 0];
final List<int> t300Thermal = [50, 53, 58, 60, 63, 65, 66, 62, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 66, 58, 0, 44];
final List<int> t300Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t300Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var t300 = [t300Grid, t300Diesel, t300Wind, t300Ess_, t300Ess, t300Thermal_, t300Thermal, t300Hydrogen_, t300Hydrogen];

final List<int> t400Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t400Diesel = [241, 219, 203, 203, 203, 241, 252, 249, 301, 310, 351, 329, 351, 323, 329, 321, 329, 345, 400, 395, 395, 334, 296, 268];
final List<int> t400Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> t400Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t400Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t400Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, -54, -57, -61, -68, -77, -87, -93, -91, -86, -80, 0, 0, 0, -51, 0];
final List<int> t400Thermal = [50, 53, 58, 60, 63, 65, 66, 62, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 66, 58, 0, 44];
final List<int> t400Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t400Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var t400 = [t400Grid, t400Diesel, t400Wind, t400Ess_, t400Ess, t400Thermal_, t400Thermal, t400Hydrogen_, t400Hydrogen];

final List<int> t500Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t500Diesel = [301, 274, 253, 253, 253, 301, 315, 312, 377, 387, 438, 411, 438, 404, 411, 401, 411, 432, 500, 493, 493, 418, 370, 336];
final List<int> t500Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> t500Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> t500Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

final List<int> t500Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, -54, -57, -61, -68, -77, -87, -93, -91, -86, -80, 0, 0, 0, -51, 0];
final List<int> t500Thermal = [50, 53, 58, 60, 63, 65, 66, 62, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 66, 58, 0, 44];
final List<int> t500Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

final List<int> t500Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var t500 = [t500Grid, t500Diesel, t500Wind, t500Ess_, t500Ess, t500Thermal_, t500Thermal, t500Hydrogen_, t500Hydrogen];

var tData = [t100, t200, t300, t400, t500];

final List<int> h100Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h100Diesel = [11, 1, 0, 0, 0, 0, 0, 0, 17, 22, 22, 21, 20, 4, 0, 0, 0, 0, 20, 22, 22, 22, 22, 22];
final List<int> h100Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> h100Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h100Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h100Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h100Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h100Hydrogen_ = [0, 0, -7, -9, -13, -5, -3, 0, 0, 0, 0, 0, 0, 0, -5, -12, -8, 0, 0, 0, 0, 0, 0, 0];
final List<int> h100Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 3, 11, 4, 1, 1];

var h100 = [h100Grid, h100Diesel, h100Wind, h100Ess_, h100Ess, h100Thermal_, h100Thermal, h100Hydrogen_, h100Hydrogen];

final List<int> h200Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h200Diesel = [71, 56, 44, 42, 38, 55, 60, 62, 93, 100, 101, 101, 101, 84, 77, 68, 74, 86, 101, 101, 101, 101, 97, 90];
final List<int> h200Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> h200Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h200Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h200Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h200Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h200Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h200Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 3, 7, 0, 0, 0, 0, 0, 19, 23, 31, 8, 0, 0];

var h200 = [h200Grid, h200Diesel, h200Wind, h200Ess_, h200Ess, h200Thermal_, h200Thermal, h200Hydrogen_, h200Hydrogen];

final List<int> h300Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h300Diesel = [131, 111, 94, 92, 89, 115, 123, 125, 168, 178, 180, 180, 180, 165, 159, 148, 156, 172, 180, 180, 180, 180, 171, 157];
final List<int> h300Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> h300Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h300Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h300Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h300Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h300Hydrogen_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h300Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 6, 15, 0, 0, 0, 0, 0, 40, 42, 50, 12, 0, 0];

var h300 = [h300Grid, h300Diesel, h300Wind, h300Ess_, h300Ess, h300Thermal_, h300Thermal, h300Hydrogen_, h300Hydrogen];

final List<int> h400Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h400Diesel = [191, 166, 147, 147, 147, 176, 186, 187, 229, 229, 229, 229, 229, 229, 229, 228, 229, 229, 229, 229, 229, 229, 229, 224];
final List<int> h400Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> h400Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h400Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h400Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h400Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h400Hydrogen_ = [0, 0, -2, -4, -7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h400Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 15, 26, 65, 39, 54, 17, 13, 0, 9, 30, 91, 92, 100, 47, 16, 0];

var h400 = [h400Grid, h400Diesel, h400Wind, h400Ess_, h400Ess, h400Thermal_, h400Thermal, h400Hydrogen_, h400Hydrogen];

final List<int> h500Grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h500Diesel = [252, 224, 224, 224, 224, 236, 249, 249, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278];
final List<int> h500Wind = [50, 53, 58, 60, 63, 65, 66, 62, 58, 54, 57, 61, 68, 77, 87, 93, 91, 86, 80, 74, 66, 58, 51, 44];
final List<int> h500Ess_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h500Ess = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h500Thermal_ = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h500Thermal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h500Hydrogen_ = [0, -4, -29, -31, -34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final List<int> h500Hydrogen = [0, 0, 0, 0, 0, 0, 0, 0, 41, 55, 104, 73, 93, 49, 46, 31, 43, 67, 142, 142, 150, 82, 41, 14];

var h500 = [h500Grid, h500Diesel, h500Wind, h500Ess_, h500Ess, h500Thermal_, h500Thermal, h500Hydrogen_, h500Hydrogen];

var hData = [h100, h200, h300, h400, h500];

var dataT = [gData, sData, tData, hData];

final gConf100 = [100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final gConf200 = [200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final gConf300 = [300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final gConf400 = [400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
final gConf500 = [500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var gConf = [gConf100, gConf200, gConf300, gConf400, gConf500];

final sConf100 = [0, 1, 100, 1, 225, 90, 70, 0, 0, 0, 0];
final sConf200 = [0, 2, 100, 1, 225, 90, 70, 0, 0, 0, 0];
final sConf300 = [0, 3, 100, 1, 225, 75, 200, 0, 0, 0, 0];
final sConf400 = [0, 4, 100, 1, 225, 75, 200, 0, 0, 0, 0];
final sConf500 = [0, 6, 100, 1, 225, 75, 200, 0, 0, 0, 0];

var sConf = [sConf100, sConf200, sConf300, sConf400, sConf500];

final tConf100 = [0, 2, 100, 2, 225, 0, 0, 225, 900, 0, 0];
final tConf200 = [0, 3, 100, 2, 225, 0, 0, 225, 900, 0, 0];
final tConf300 = [0, 4, 100, 2, 225, 0, 0, 225, 900, 0, 0];
final tConf400 = [0, 6, 100, 2, 225, 0, 0, 225, 900, 0, 0];
final tConf500 = [0, 7, 100, 2, 225, 0, 0, 225, 900, 0, 0];

var tConf = [tConf100, tConf200, tConf300, tConf400, tConf500];

final hConf100 = [0, 1, 100, 2, 225, 0, 0, 0, 0, 50, 10000];
final hConf200 = [0, 2, 100, 2, 225, 0, 0, 0, 0, 50, 12000];
final hConf300 = [0, 3, 100, 2, 225, 0, 0, 0, 0, 50, 19000];
final hConf400 = [0, 3, 100, 2, 225, 0, 0, 0, 0, 100, 73500];
final hConf500 = [0, 0, 0, 2, 225, 0, 0, 0, 0, 150, 160000];

var hConf = [hConf100, hConf200, hConf300, hConf400, hConf500];

var conf = [gConf, sConf, tConf, hConf];

const ticks = [1, 2, 3, 4, 5];
var features = ["Экономичность", "Надежность", "Безуглеродность"];

var data = [
  [
    [LedBulbColors.red, LedBulbColors.yellow, LedBulbColors.yellow],
    [LedBulbColors.green, LedBulbColors.green, LedBulbColors.yellow],
    [LedBulbColors.green, LedBulbColors.yellow, LedBulbColors.red],
    [LedBulbColors.yellow, LedBulbColors.green, LedBulbColors.green]
  ],
  [
    [LedBulbColors.red, LedBulbColors.yellow, LedBulbColors.yellow],
    [LedBulbColors.green, LedBulbColors.green, LedBulbColors.yellow],
    [LedBulbColors.green, LedBulbColors.yellow, LedBulbColors.red],
    [LedBulbColors.green, LedBulbColors.green, LedBulbColors.green]
  ],
  [
    [LedBulbColors.red, LedBulbColors.yellow, LedBulbColors.red],
    [LedBulbColors.green, LedBulbColors.green, LedBulbColors.yellow],
    [LedBulbColors.green, LedBulbColors.yellow, LedBulbColors.red],
    [LedBulbColors.yellow, LedBulbColors.green, LedBulbColors.green]
  ],
  [
    [LedBulbColors.red, LedBulbColors.yellow, LedBulbColors.red],
    [LedBulbColors.green, LedBulbColors.green, LedBulbColors.yellow],
    [LedBulbColors.green, LedBulbColors.yellow, LedBulbColors.red],
    [LedBulbColors.red, LedBulbColors.green, LedBulbColors.green]
  ],
  [
    [LedBulbColors.yellow, LedBulbColors.yellow, LedBulbColors.red],
    [LedBulbColors.green, LedBulbColors.green, LedBulbColors.yellow],
    [LedBulbColors.green, LedBulbColors.yellow, LedBulbColors.red],
    [LedBulbColors.red, LedBulbColors.green, LedBulbColors.green]
  ],
];

const customColors = [Colors.black54, Colors.blueAccent, Colors.orange, Colors.green];
const background = Color.fromRGBO(244, 244, 244, 1);

const yellowButton = Color.fromRGBO(239, 236, 158, 1);
const blueButton = Color.fromRGBO(153, 194, 231, 1);
const greenButton = Color.fromRGBO(157, 225, 168, 1);

const greyMenu = Color.fromRGBO(232, 232, 232, 1);
const blueMenu = Color.fromRGBO(225, 237, 255, 1);
const orangeMenu = Color.fromRGBO(255, 240, 217, 1);
const azureMenu = Color.fromRGBO(212, 250, 253, 1);

var menuColors = [greyMenu, blueMenu, orangeMenu, azureMenu];

const confElectro = "Строительство сети";
const confBattery = "Установка литий-ионного накопителя";
const confBoiled = "Переход на электроотопление";
const congHydro = "Установка водородного накопителя";
var confNames = [confElectro, confBattery, confBoiled, congHydro];

const blueMainButton = Color.fromRGBO(143, 170, 221, 1);
const blueConfigurationButton = Color.fromRGBO(170, 188, 217, 1);
const textColor = Color.fromRGBO(0, 0, 0, 1);

const String fontNameDefault = 'Manrope-Regular';
const String fontNameLight = 'Manrope-Light';
const String fontNameBold = 'Manrope-Bold';

const largeTextSize = 26.0;
const mediumTextSize = 20.0;
const bodyTextSize = 16.0;
