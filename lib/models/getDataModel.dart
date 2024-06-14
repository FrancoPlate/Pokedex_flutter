import 'dart:convert';

GetDataModel getDataModelFromJson(String str) => GetDataModel.fromJson(json.decode(str));

String getDataModelToJson(GetDataModel data) => json.encode(data.toJson());

class GetDataModel {
  List<Result> results;

  GetDataModel({
    required this.results,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  int pokId;
  String pokNum;
  String pokName;
  String pokImg;
  String pokTipo1;
  String? pokTipo2;
  String pokAlto;
  String pokPeso;
  int pokTotal;
  int pokHp;
  int pokAttack;
  int pokDefense;
  int pokAtk;
  int pokDef;
  int pokSpeed;

  Result({
    required this.pokId,
    required this.pokNum,
    required this.pokName,
    required this.pokImg,
    required this.pokTipo1,
    required this.pokTipo2,
    required this.pokAlto,
    required this.pokPeso,
    required this.pokTotal,
    required this.pokHp,
    required this.pokAttack,
    required this.pokDefense,
    required this.pokAtk,
    required this.pokDef,
    required this.pokSpeed,
  });

  //parchado para que no tire error ... "?? 0," pregunta si esta vacio y si lo esta lo convierte en 0 int
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pokId: json["pok_id"],
        pokNum: json["pok_num"] ,
        pokName: json["pok_name"] ,
        pokImg: json["pok_img"] ,
        pokTipo1: json["pok_tipo1"],
        pokTipo2: json["pok_tipo2"],
        pokAlto: json["pok_alto"],
        pokPeso: json["pok_peso"],
        pokTotal: json["pok_total"],
        pokHp: json["pok_hp"],
        pokAttack: json["pok_attack"],
        pokDefense: json["pok_defense"],
        pokAtk: json["pok_atk"],
        pokDef: json["pok_def"],
        pokSpeed: json["pok_speed"],
      );

  Map<String, dynamic> toJson() => {
        "pok_id": pokId,
        "pok_num": pokNum,
        "pok_name": pokName,
        "pok_img": pokImg,
        "pok_tipo1": pokTipo1,
        "pok_tipo2": pokTipo2,
        "pok_alto": pokAlto,
        "pok_peso": pokPeso,
        "pok_total": pokTotal,
        "pok_hp": pokHp,
        "pok_attack": pokAttack,
        "pok_defense": pokDefense,
        "pok_atk": pokAtk,
        "pok_def": pokDef,
        "pok_speed": pokSpeed,
      };
}
