import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_pokemon/models/getDataModel.dart';





class GetDataController extends GetxController {
   var isLoading = false.obs;
   var getDataModel = GetDataModel(results: []).obs;

  void getDataFromApi() async {
    String url = 'http://192.168.0.128:8080/api/pokemones'; // Cambia localhost por tu IP

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
      );

      //---------------------------------- Lineas necesarios para que ande 
      if (response.statusCode == 200) { // verificamos el estatus de la solicitud
        final List<dynamic> pokemones = json.decode(response.body); // convertimos el json que nos llega en una lista dinamica llamada pokemones
        getDataModel.value = GetDataModel( // el valor de getDataModel.value = va hacer el valor del modelo del get
          results: pokemones.map((json) => Result.fromJson(json)).toList(),// <-- mapea la lista de respuestas JSON a una lista de objetos Result
        );
      }
      //----------------------------------
      else {
        // Solicitud fallida
        print('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (e) {
      // Error al realizar la solicitud
      print('Error al realizar la solicitud HTTP: $e');
    } finally {
      isLoading(false);
    }
  }
}



//class GetDataController extends GetxController {
//  var isLoading = false.obs;
//  var getDataModel = GetDataModel(results: []).obs;
//
//  getDataFromApi() async {
//    //esto trae info de la api
//    isLoading.value = true;
//    try {
//        var response = await http.get(Uri.parse(
//        'http://localhost:8080/api/pokemones')); //esto de vuelve un json osea string, hay que convertirlo con la linea siguiente
//        print(response.body);
//        final resp = getDataModelFromJson(response.body);
//        print(resp.results);
//        getDataModel.value = resp;
//        // final datas = json.decode(response.datas);
//        // getDataModel.value = GetDataModel.fromJson(datas);
//
//        //var response = await Dio().get(
//        //  'http://192.168.0.128:8080/api/pokemones');
//        //var datas = json.decode(response.data);
//        //getDataModel.value = GetDataModel.fromJson(datas);
//        isLoading.value = false;
//              
//    } catch (e) {
//      // ignore: avoid_print
//      print(e);
//    }
//  }
//
//}


//flutter run -d chome --web-renderer html






















