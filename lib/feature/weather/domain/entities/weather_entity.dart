import 'package:weather/feature/weather/domain/entities/cloud.dart';
import 'package:weather/feature/weather/domain/entities/coord.dart';
import 'package:weather/feature/weather/domain/entities/sys.dart';
import 'package:weather/feature/weather/domain/entities/w_main.dart';
import 'package:weather/feature/weather/domain/entities/weather_info.dart';
import 'package:weather/feature/weather/domain/entities/wind.dart';

class WeatherEntity {
  Coord? coord;
  List<WeatherInfo>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherEntity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });
}
