import 'package:weather/feature/weather/domain/entities/cloud.dart';
import 'package:weather/feature/weather/domain/entities/coord.dart';
import 'package:weather/feature/weather/domain/entities/sys.dart';
import 'package:weather/feature/weather/domain/entities/w_main.dart';
import 'package:weather/feature/weather/domain/entities/weather_entity.dart';
import 'package:weather/feature/weather/domain/entities/weather_info.dart';
import 'package:weather/feature/weather/domain/entities/wind.dart';

class Weather extends WeatherEntity {
  Weather({
    super.coord,
    super.weather,
    super.base,
    super.main,
    super.visibility,
    super.wind,
    super.clouds,
    super.dt,
    super.sys,
    super.timezone,
    super.id,
    super.name,
    super.cod,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <WeatherInfo>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherInfo.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}