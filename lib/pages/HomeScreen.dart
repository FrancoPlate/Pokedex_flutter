import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/controller/getDataController.dart';
import 'package:flutter_pokemon/pages/DetailsScreen.dart';
import 'package:flutter_pokemon/pages/ListaHorizontal.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State <HomeScreen> createState() =>  _HomeScreenState();
}

class  _HomeScreenState extends State<HomeScreen> {

  String? selectedType;
  final customFamily = 'Schyler-Regular';
  final getDataController = Get.put(GetDataController());
 
  @override
  void initState(){
    getDataController.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold( 
        backgroundColor: Colors.transparent,
        body: !getDataController.isLoading.value? 
          Container(
            height: height,
            width: width,
            decoration:const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(0, 0, 0, 1),
                  Color.fromRGBO(21, 48, 71, 1),
                  Color.fromRGBO(38, 84, 125, 1),
                ],
              ),
            ),
            child: Stack(
              children: [
                
                _TextoTitulo(),
               // _Tipos(selectedType),
                Positioned(
                  top: 300, left: 0, right: 0,bottom: 0,
                  child: _Grilla(),//selectedType
                ),
                
              ],
            ),
          ):
        const Center(child: CircularProgressIndicator(),),
      ),
    );
    
  }

  
  Widget _TextoTitulo(){

    return Positioned(

      top: 80,
      left: 30,
      child: Column(
        children: [

          Image.asset('images/Pokémon_logo.png',
            fit: BoxFit.fitWidth,
            height: 100,
          ),

          SizedBox(height: 20),
          Text(
            '¡ Bienvenido a la Pokédex !',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:Color.fromRGBO(240, 248, 255, 1),
              fontFamily: customFamily,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Explora y descubre todos los Pokémon.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:Color.fromRGBO(240, 248, 255, 1),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      )
    );

  }

//  Widget _Tipos(selectedType){
//    var width = MediaQuery.of(context).size.width;
//
//    return Positioned(
//      top: 330,
//      child: Container(
//        height: 100,
//        width: width,
//
//        child: TipoList( 
//          onSelectType: (type) {
//            setState(() {
//              selectedType = type;
//            });
//          }
//        ),
//
//      )
//
//    );
//  }
  

 Widget _Grilla() { //String? selectedType

//    List<dynamic> filteredResults = getDataController.getDataModel.value.results;
//      if (selectedType != null && selectedType.isNotEmpty) {
//        filteredResults = filteredResults.where((pokemon) =>
//          pokemon.pokTipo1 == selectedType || pokemon.pokTipo2 == selectedType).toList();
//      }


    return GridView.builder(
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2,
      ),
      itemCount: 807,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final tipo1 = getDataController.getDataModel.value.results[index].pokTipo1;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: InkWell(
            child: SafeArea(
              child: Container( 
                decoration: BoxDecoration(
                  
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color:   
                      tipo1 == "Grass" ? Color.fromARGB(209,61, 162, 36)
                      : tipo1 == "Fire"? const Color.fromARGB(209, 231, 35, 36)
                      : tipo1 == "Water"? const Color.fromARGB(209, 36, 129, 239) 
                      : tipo1 == "Electric"? const Color.fromARGB(209, 250, 193, 0)
                      : tipo1 == "Bug"? Color.fromARGB(209, 146, 162, 18)
                      : tipo1 == "Poison"? const Color.fromARGB(209, 146, 63, 204)
                      : tipo1 == "Ground"? const Color.fromARGB(209, 146, 80, 27)
                      : tipo1 == "Fighting"? const Color.fromARGB(209, 255, 129, 0)
                      : tipo1 == "Psychic"? const Color.fromARGB(209, 239, 63, 122)
                      : tipo1 == "Dragon"? const Color.fromARGB(209, 78, 95, 225)
                      : tipo1 == "Rock"? const Color.fromARGB(209, 176, 170, 130) 
                      : tipo1 == "Ice"? const Color.fromARGB(209, 61, 217, 255)
                      : tipo1 == "Dark"? const Color.fromARGB(209, 79, 63, 61)
                      : tipo1 == "Steel"? const Color.fromARGB(209, 96, 162, 185)
                      : tipo1 == "Flying"? const Color.fromARGB(209, 130, 186, 239)
                      : tipo1 == "Fairy"? const Color.fromARGB(209, 239, 112, 239)
                      : tipo1 == "Ghost"? const Color.fromARGB(209, 112, 63, 112)
                      : Color.fromARGB(255, 160, 162, 160),
                      offset: Offset(1, 4),
                      blurRadius: 10,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.normal,
                    )
                  ],
                  color:// ? = si  : sino  
                      tipo1 == "Grass" ? Color.fromARGB(209,61, 162, 36)
                    : tipo1 == "Fire"? const Color.fromARGB(209, 231, 35, 36)
                    : tipo1 == "Water"? const Color.fromARGB(209, 36, 129, 239) 
                    : tipo1 == "Electric"? const Color.fromARGB(209, 250, 193, 0)
                    : tipo1 == "Bug"? Color.fromARGB(209, 146, 162, 18)
                    : tipo1 == "Poison"? const Color.fromARGB(209, 146, 63, 204)
                    : tipo1 == "Ground"? const Color.fromARGB(209, 146, 80, 27)
                    : tipo1 == "Fighting"? const Color.fromARGB(209, 255, 129, 0)
                    : tipo1 == "Psychic"? const Color.fromARGB(209, 239, 63, 122)
                    : tipo1 == "Dragon"? const Color.fromARGB(209, 78, 95, 225)
                    : tipo1 == "Rock"? const Color.fromARGB(209, 176, 170, 130) 
                    : tipo1 == "Ice"? const Color.fromARGB(209, 61, 217, 255)
                    : tipo1 == "Dark"? const Color.fromARGB(209, 79, 63, 61)
                    : tipo1 == "Steel"? const Color.fromARGB(209, 96, 162, 185)
                    : tipo1 == "Flying"? const Color.fromARGB(209, 130, 186, 239)
                    : tipo1 == "Fairy"? const Color.fromARGB(209, 239, 112, 239)
                    : tipo1 == "Ghost"? const Color.fromARGB(209, 112, 63, 112)
                    : Color.fromARGB(255, 160, 162, 160)
                ),

                child: Stack
                  (children:[
                    _PokeballInterna(),
                    _ImagenPokemon( index),
                    _NombrePokemon( index),
                    _TipoPokemon( index),
                  ]),

              )
            ),
            onTap: (){
              Navigator.push(
                context,MaterialPageRoute(
                  builder:(_)=> DetailsScreen(
                    heroTag: index,
                    Wpoknom: getDataController.getDataModel.value. results[index].pokName,
                    WpokTipo1: getDataController.getDataModel.value. results[index].pokTipo1,
                    WpokTipo2: getDataController.getDataModel.value. results[index].pokTipo2,
                    WpokNum: getDataController.getDataModel.value. results[index].pokNum,
                    WpokImg: getDataController.getDataModel.value. results[index].pokImg,
                    WpokAlt: getDataController.getDataModel.value. results[index].pokAlto,
                    WpokPes: getDataController.getDataModel.value. results[index].pokPeso,
                    WpokTot: getDataController.getDataModel.value. results[index].pokTotal,
                    WpokHp: getDataController.getDataModel.value. results[index].pokHp,
                    WpokAtt: getDataController.getDataModel.value. results[index].pokAttack,
                    WpokDef: getDataController.getDataModel.value. results[index].pokDefense,
                    WpokAttE: getDataController.getDataModel.value. results[index].pokAtk,
                    WpokDefE: getDataController.getDataModel.value. results[index].pokDef,
                    WpokSpeed: getDataController.getDataModel.value. results[index].pokSpeed,
                  )
                )
              );
            },

          )

        );

      }
    );
  } 

  
  Widget _PokeballInterna() {
    return Positioned(
      bottom: -10,
      right: -130,
      child: Image.asset(
        'images/Pokeball.png',
        height: 200,
        fit: BoxFit.fitHeight,
        opacity: const AlwaysStoppedAnimation(0.3),
      ),
    );
  }

  
  Widget _ImagenPokemon(index){
    return Positioned(
      bottom: 50,
       right: -30,
       child: Hero(
        tag: index,
         child: CachedNetworkImage(
          imageUrl: getDataController.getDataModel.value.results[index].pokImg,
           height: 100,
           width: 200,
           fit: BoxFit.fitHeight,
            placeholder: (context,url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
       ),
    );
  }

  
  Widget _NombrePokemon(index){
    return Positioned(
      top: 10,
      left: 10,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(
            getDataController.getDataModel.value.results[index].pokName,
            style: const TextStyle(
              color: Color.fromARGB(248, 240, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 24,
              
            ),
          ),
          SizedBox(height: 10),

          Text(
            "N.° "+ getDataController.getDataModel.value.results[index].pokNum,
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(248, 240, 255, 255),
              fontWeight: FontWeight.bold

            ),

          )

        ],
      )
    );

  }

  
  Widget _TipoPokemon(index){
    final tipo1 = getDataController.getDataModel.value. results[index].pokTipo1;
    return Positioned(
      bottom: 20,
      left: 10,
      
      child: Row(
        children: 
        [
          Container(

            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
              child:  Row(
                children: [
                  SvgPicture.string(
                    tipo1 == "Grass" ? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M11.47 66.62H29.1s4.82-44.39 2.33-44.39-19.96 44.39-19.96 44.39zm29.6 0h17.62S67 22.23 64.51 22.23 41.07 66.62 41.07 66.62zm-5.99 0l12.8-25.44s4.66-30.26 2.49-30.26-13.14 26.94-13.14 26.94l-2.16 28.76z" fill="#fff"/></svg>'
                    : tipo1 == "Fire"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M55.78 38.1c-5.32-5.15-3.66-9.14-1.21-11.26 0 0-6.53-.79-8.85 4.53-2.33 5.32 2.16 8.06 2.16 8.06s-6.48-2.58-4.66-8.9c1.61-5.56 4.57-8.48 3.24-14.38-1.5-6.67-10.97-9.49-15.55-7.74 3.2 1.08 5.51 4.09 5.51 7.66 0 4.16-3.29 6.92-7.71 11.39-5.11 5.15-10.32 10.97-10.32 20.31 0 10.78 6.65 17.45 14.62 19.87-4.04-1.93-12.45-7.99-11.4-19.65 1.1-12.3 12.89-20.7 12.89-20.7s-2.54 4.26-1.43 11.16c.62 3.88 3.4 8.65 6.05 10.72 3.72 2.91 8.64 5.93 7.93 11.45-.67 5.18-7.55 7.5-11.02 7.71 1.58.26 3.19.37 4.78.32 11.81 0 20.58-8.78 20.58-18.12 0-7.39-3.54-10.43-5.62-12.43z" fill="#fff"/></svg>'
                    : tipo1 == "Water"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M54 41.57s-3.96-6.86-5.85-9.78c-1.97-3.07-3.82-6.73-5.26-12.61-1.44-5.87-2.22-11.53-4.54-11.53s-3.1 5.65-4.54 11.53c-1.44 5.87-3.29 9.53-5.26 12.61-1.88 2.93-5.85 9.78-5.85 9.78a18.018 18.018 0 00-2.58 9.32c0 10.03 8.2 18.17 18.23 18.17s18.23-8.13 18.23-18.17c0-3.41-.95-6.59-2.58-9.32zM38.35 64.96c-8.18 0-14.61-6.1-14.61-10.5 0-2.91 6.43 2.52 14.61 2.52s14.61-5.43 14.61-2.52c0 4.41-6.43 10.5-14.61 10.5z" fill="#fff"/></svg>'
                    : tipo1 == "Electric"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M37.97 6.94c2.5 1.14 12.84 6.04 19.84 12.22.31.27.34.75.07 1.06-1.55 1.8-6.66 7.75-12.82 14.99-.27.32-.24.8.07 1.08 1.8 1.59 7.48 6.69 10.91 10.43.28.3.26.77-.04 1.06-2.98 2.87-17.73 17.06-23.45 21.97-.3.26-.76-.02-.67-.41.74-3.02 2.8-11.05 4.99-16.89.12-.31.02-.66-.25-.86-2.15-1.64-11.56-8.86-17.74-14.4a.746.746 0 01-.16-.91c1.36-2.62 7.8-14.72 18.32-29.07.21-.29.6-.4.92-.25z" fill="#fff"/></svg>'
                    : tipo1 == "Bug"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M38.35 28.23c8.1 0 15.19-3.44 19.07-8.57-3.88-6.28-10.97-10.49-19.07-10.49s-15.19 4.21-19.07 10.49c3.88 5.13 10.97 8.57 19.07 8.57zm22.84-4.26c-4.56 5.02-11.7 8.47-19.88 9.14l10.93 34.42c8.67-5.52 14.42-15.13 14.42-26.08 0-6.49-2.02-12.5-5.47-17.48zm-45.67 0c4.56 5.02 11.7 8.47 19.88 9.14L24.47 67.53C15.8 62.01 10.05 52.4 10.05 41.45c0-6.49 2.02-12.5 5.47-17.48zm22.83 30.75c1.66 0 3.31-.37 4.83-1.09l-1.3-4.74a6.554 6.554 0 01-7.07 0l-1.3 4.74c1.53.72 3.18 1.09 4.83 1.09zm0 9.14c2.53 0 4.98-.48 7.27-1.36l-1.33-4.85c-1.85.79-3.86 1.21-5.94 1.21s-4.08-.42-5.94-1.21l-1.33 4.85c2.29.88 4.74 1.36 7.27 1.36z" fill="#fff"/></svg>'
                    : tipo1 == "Poison"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><g><path fill="#fff" d="M47.7 56.75c-.55-4.68-4.52-8.31-9.35-8.31s-8.8 3.63-9.35 8.31c-11.51.84-19.8 3.18-19.8 5.93 0 3.46 13.05 6.26 29.15 6.26s29.15-2.8 29.15-6.26c0-2.76-8.29-5.09-19.8-5.93z"/><circle fill="#fff" cx="28.31" cy="23.22" r="11.2"/><circle fill="#fff" cx="51.28" cy="37.57" r="6.64"/></g></svg>'
                    : tipo1 == "Ground"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><g><path fill="#fff" d="M52.29 16.07h8.31v8.31h-8.31zm-24.44 6.49h6.48v6.48h-6.48zM13.55 8.92h10.81v10.81H13.55zm53.89 39.29V46.1L38.35 34.49 9.26 46.1v2.11l29.09 11.6 29.09-11.6z"/><path fill="#fff" d="M67.52 53.52L38.35 65.3 9.19 53.52l-1.47 3.64 30.63 12.38 30.64-12.38-1.47-3.64z"/></g></svg>'
                    : tipo1 == "Fighting"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M40.72 34.03h21.8v9.88h-21.8v-9.88zm13.33-22v17.66h8.47V12.03h-8.47zm-4.86 0h-8.47v17.66h8.47V12.03zm-13.2 0h-8.47v23.22h8.47V12.03zm-13.33 0h-8.47v23.22h8.47V12.03zm14.03 31.43h-22.5v12.97l14.41 9.42 33.92-10.46v-7.38H36.69v-4.54z" fill="#fff"/></svg>'
                    : tipo1 == "Psychic"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M38.35 16.28c.29 0 .59.16.72.48 2.62 6.29 8.79 10.32 15.47 10.32.71 0 1.43-.05 2.15-.14h.11c.63 0 1.01.73.61 1.26-4.58 5.98-4.58 14.34-.02 20.33.4.52.01 1.25-.61 1.25h-.11c-.72-.09-1.43-.14-2.14-.14-6.68 0-12.85 4.02-15.47 10.32-.13.32-.43.48-.72.48s-.59-.16-.72-.48C35 53.67 28.83 49.64 22.15 49.64c-.71 0-1.43.05-2.15.14h-.11c-.63 0-1.01-.73-.61-1.26 4.58-5.98 4.58-14.34.02-20.33-.4-.52-.01-1.25.61-1.25h.11c.72.09 1.43.14 2.14.14 6.68 0 12.85-4.02 15.47-10.32.13-.32.43-.48.72-.48m0-8.7c-3.84 0-7.28 2.29-8.75 5.84-1.23 2.96-4.22 4.96-7.44 4.96-.34 0-.68-.02-1.02-.07-.4-.05-.81-.08-1.22-.08-3.62 0-6.88 2.02-8.49 5.27a9.42 9.42 0 00.95 9.95c2.19 2.88 2.19 6.9 0 9.77a9.417 9.417 0 00-.97 9.96 9.407 9.407 0 008.49 5.28c.41 0 .82-.03 1.23-.08.34-.04.69-.07 1.03-.07 3.22 0 6.21 1.99 7.44 4.96 1.48 3.55 4.91 5.84 8.75 5.84s7.28-2.29 8.75-5.84c1.23-2.96 4.22-4.96 7.44-4.96.34 0 .68.02 1.02.07.4.05.81.08 1.22.08 3.62 0 6.88-2.02 8.49-5.27a9.42 9.42 0 00-.95-9.95c-2.19-2.88-2.19-6.9 0-9.77 2.21-2.89 2.58-6.7.97-9.96a9.407 9.407 0 00-8.49-5.28c-.41 0-.82.03-1.23.08-.34.04-.69.07-1.03.07-3.22 0-6.21-1.99-7.44-4.96a9.443 9.443 0 00-8.75-5.84z" fill="#fff"/></svg>'
                    : tipo1 == "Dragon"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M12.39 23.98c-8.41 11.05-7.23 26.81 3.02 36.47 1.09-3.6 3.14-6.95 6.1-9.6a20.91 20.91 0 01-4.04-10.48c-5.13-3.92-7-10.56-5.08-16.4zm51.92 0c1.92 5.84.05 12.48-5.08 16.4-.38 3.88-1.82 7.47-4.04 10.48 2.96 2.65 5.01 5.99 6.1 9.6 10.25-9.65 11.43-25.42 3.02-36.47zm-12.95 1.33c-1.12-7.41-3.63-15.73-4.89-19.64-.22-.68-1.26-.66-1.44.03-1.17 4.28-2.6 11.09-3.24 14.2-1.07-.2-2.29-.32-3.42-.32s-2.35.11-3.42.32c-.64-3.11-2.07-9.91-3.24-14.2-.19-.69-1.22-.72-1.44-.03-1.26 3.91-3.78 12.22-4.89 19.64-2.67 2.99-4.3 6.93-4.3 11.33 0 6.35 3.37 13.85 8.39 18.21l1.38 12.27c0 1.8 3.37 4.41 7.53 4.41s7.53-2.62 7.53-4.41l1.38-12.27c5.02-4.36 8.39-11.86 8.39-18.21 0-4.4-1.63-8.34-4.3-11.33zM29.81 48.82c-2.98-.92-5.06-3.61-5.15-6.73-.12-3.67.07-7.59.07-7.59l9.2 15.41c-1.61-.37-2.97-.74-4.12-1.09zm17.1 0c-1.14.35-2.51.73-4.12 1.09l9.2-15.41s.19 3.92.07 7.59a7.285 7.285 0 01-5.15 6.73z" fill="#fff"/></svg>'
                    : tipo1 == "Rock"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path fill="#fff" d="M58.71 18l2.67 11.72-14.39-14.39L58.71 18l-8.43-8.43H26.43L9.57 26.43v23.85l8.23 8.23-4.49-19.72L37.52 63 17.8 58.51l8.63 8.63h23.85l8.43-8.43-19.72 4.49L63.2 38.99l-4.49 19.72 8.43-8.43V26.43L58.71 18z"/></svg>'
                    : tipo1 == "Ice"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><g><path fill="#fff" transform="rotate(-45 38.354 11.743)" d="M33.44 6.82h9.83v9.83h-9.83z"/><path fill="#fff" d="M11.49 48.24h9.83v9.83h-9.83z"/><path fill="#fff" transform="rotate(-45 38.353 64.974)" d="M33.44 60.05h9.83v9.83h-9.83z"/><path fill="#fff" d="M55.38 18.75v9.77l-17.03-9.83-17.03 9.83v-9.77h-9.83v9.83h9.83v19.6l17.03 9.83 17.03-9.83v-19.6h9.83v-9.83h-9.83zM31.14 34.32v9.62h-5.11v-12.6h.05l10.86-6.27 2.55 4.42-8.36 4.83zm24.24 13.92h9.83v9.83h-9.83z"/></g></svg>'
                    : tipo1 == "Dark"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><g><path fill="#fff" d="M60.1 20.73s-3.25 4.41-10.78 6.74c.84 2.28 1.32 4.93 1.32 7.9 0 10.15-5.5 18.39-12.28 18.39s-12.28-7.27-12.28-18.39c0-2.95.58-5.58 1.52-7.84-7.67-2.32-10.98-6.8-10.98-6.8s-7.54 8.04-6.83 17.19c.42 5.33 3.3 11.6 10.35 17.38 0 0 7.54 6.66 18.22 6.66s18.22-6.66 18.22-6.66c7.05-5.78 9.93-12.04 10.35-17.38.72-9.15-6.83-17.19-6.83-17.19z"/><path fill="#fff" d="M35.54 28.85c-.96 2-1.58 4.89-1.58 7.72 0 5.08 1.97 9.19 4.39 9.19s4.39-4.12 4.39-9.19c0-2.84-.61-5.73-1.58-7.72-.9.04-1.84.05-2.81.02-.97.03-1.91.02-2.81-.02z"/></g></svg>'
                    : tipo1 == "Steel"?  '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><defs><style>.cls-1{fill:#fff}</style></defs><g><path class="cls-1" d="M41 27.35l9.18 32.02 17.37-12.62-8.03-24.71L41 27.35zM52.3 37.6c-2.52 0-4.56-2.04-4.56-4.56s2.04-4.56 4.56-4.56 4.56 2.04 4.56 4.56-2.04 4.56-4.56 4.56z"/><path class="cls-1" d="M37.9 38.21l-4.29-14.95 24.07-6.9-1.28-3.93H20.3L9.15 46.75l28.75-8.54zM26.03 15.23c1.87 0 3.38 1.51 3.38 3.38s-1.51 3.38-3.38 3.38-3.38-1.51-3.38-3.38 1.51-3.38 3.38-3.38zm13.01 26.95l-25.69 7.63 25 18.17 6.69-4.87-6-20.93z"/></g></svg>'
                    : tipo1 == "Flying"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M23.78 27.7c-1.94 4.43-7.5 23.12-8.81 33.15-.67 5.09-1.31 6.86 0 7.25 1.66.5 8.65-10.31 11.14-14.47 0 0 15.92 2.39 24.09-7.79.19-.24-.02-.59-.32-.53-3.22.55-14.81 2.34-19.94.35 0 0 20.89.81 30.38-14.67.13-.2-.08-.46-.3-.38-3.29 1.19-17.5 5.86-26.01 3.66 0 0 13.83-.81 24.28-10.31S69.6 9.66 68.85 8.91c-1.42-1.42-8.65 2.16-14.47 3.99s-13.14 3.99-17.96 4.99-8.81 1.08-12.64 9.81z" fill="#fff"/></svg>'
                    : tipo1 == "Fairy"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M66.36 12.08c-2.18-2.18-15.61-3.16-24.65 5.88-1.55 1.55-2.63 3.4-3.25 5.35-.62-1.96-1.7-3.8-3.25-5.35-9.04-9.04-22.47-8.06-24.65-5.88S7.4 27.69 16.44 36.73c1.91 1.91 4.26 3.11 6.73 3.61-5 4.33-5.57 11.18-4.61 12.52 1.02 1.42 8.4 3.21 14.31-.94-.27.79-.53 1.6-.79 2.44-2.47 8.08-3.39 14.96-2.07 15.36 1.33.41 4.41-5.81 6.88-13.89.62-2.03 1.15-3.99 1.56-5.79.41 1.8.94 3.76 1.56 5.79 2.47 8.08 5.55 14.3 6.88 13.89 1.33-.41.4-7.29-2.07-15.36-.26-.84-.52-1.65-.79-2.44 5.91 4.15 13.3 2.36 14.31.94.96-1.34.39-8.18-4.61-12.52 2.47-.5 4.82-1.7 6.73-3.61 9.04-9.04 8.06-22.47 5.88-24.65zm-27.9 28.05c-4.31 0-8.04-2.45-9.9-6.03 5.01-.02 9.15-3.74 9.81-8.57.02-.12.17-.12.18 0 .66 4.83 4.8 8.56 9.81 8.57-1.86 3.58-5.59 6.03-9.9 6.03z" fill="#fff"/></svg>'
                    : tipo1 == "Ghost"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M64.73 37.52c-2.45-.58-4.47.48-5.75 1.48.49-2.06.77-4.09.77-6.02 0-11.82-9.58-21.4-21.4-21.4s-21.4 9.58-21.4 21.4c0 1.93.28 3.96.77 6.02-1.28-.99-3.31-2.06-5.75-1.48-3.51.83-6.4 5.88-6.57 10.24-.03.9 1.07 1.36 1.67.69.97-1.09 2.24-2.21 3.12-1.84 2.88 1.22 3.1 6.32 5.87 6.32 2.43 0 4.52-2.43 5.54-3.86 4.66 8.79 11.84 16.06 16.74 16.06s12.07-7.26 16.74-16.06c1.02 1.43 3.11 3.86 5.54 3.86 2.77 0 2.99-5.1 5.87-6.32.88-.37 2.15.74 3.12 1.84.6.67 1.71.21 1.67-.69-.17-4.36-3.06-9.41-6.57-10.24zm-31.59-2.74c-1.78.83-4.48-1.18-6.03-4.5-1.55-3.32-1.35-6.68.43-7.51 1.78-.83 4.48 1.18 6.03 4.5 1.55 3.32 1.36 6.68-.43 7.51zm16.45-4.5c-1.55 3.32-4.25 5.33-6.03 4.5-1.78-.83-1.98-4.2-.43-7.51 1.55-3.32 4.25-5.33 6.03-4.5 1.78.83 1.98 4.2.43 7.51z" fill="#fff"/></svg>'
                    : '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M63.81 26.43c3.12-4.29 2.43-10.33-1.69-13.79-4-3.36-9.82-3.11-13.54.39-3.18-1.21-6.63-1.88-10.23-1.88s-7.05.67-10.23 1.88c-3.71-3.5-9.53-3.74-13.54-.39-4.13 3.46-4.81 9.49-1.69 13.79-2.17 4.05-3.4 8.67-3.4 13.58 0 15.91 12.95 28.86 28.86 28.86s28.86-12.95 28.86-28.86c0-4.91-1.23-9.53-3.4-13.58zM38.35 60.87c-11.5 0-20.86-9.36-20.86-20.86s9.36-20.86 20.86-20.86 20.86 9.36 20.86 20.86-9.36 20.86-20.86 20.86z" fill="#fff"/></svg>',
                    width: 20, 
                    height: 20,
                    fit:BoxFit.fill,
                  ),
                  SizedBox(width: 3,),
                  Text(
                  getDataController.getDataModel.value.results[index].pokTipo1.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                      )
                    ]
                  ),
                  ),
                ],
              )
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Color.fromARGB(83, 0, 0, 0),
            ),
          ),
          SizedBox(width:5,),
            
          getDataController.getDataModel.value.results[index].pokTipo2?.isNotEmpty ?? false
          ? SizedBox(child: _TipoPokemon2(index)) //  operador ternario para verificar si el valor está vacío o no y luego devolver el widget correspondiente
          : SizedBox(), // Si está vacío, devuelve un SizedBox
            ],
        
      ),
    );
  }

  Widget _TipoPokemon2(int index){
    final tipo2 = getDataController.getDataModel.value. results[index].pokTipo2;
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        child:  Row(
          children: [
            SvgPicture.string(
              tipo2 == "Grass" ? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M11.47 66.62H29.1s4.82-44.39 2.33-44.39-19.96 44.39-19.96 44.39zm29.6 0h17.62S67 22.23 64.51 22.23 41.07 66.62 41.07 66.62zm-5.99 0l12.8-25.44s4.66-30.26 2.49-30.26-13.14 26.94-13.14 26.94l-2.16 28.76z" fill="#fff"/></svg>'
              : tipo2 == "Fire"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M55.78 38.1c-5.32-5.15-3.66-9.14-1.21-11.26 0 0-6.53-.79-8.85 4.53-2.33 5.32 2.16 8.06 2.16 8.06s-6.48-2.58-4.66-8.9c1.61-5.56 4.57-8.48 3.24-14.38-1.5-6.67-10.97-9.49-15.55-7.74 3.2 1.08 5.51 4.09 5.51 7.66 0 4.16-3.29 6.92-7.71 11.39-5.11 5.15-10.32 10.97-10.32 20.31 0 10.78 6.65 17.45 14.62 19.87-4.04-1.93-12.45-7.99-11.4-19.65 1.1-12.3 12.89-20.7 12.89-20.7s-2.54 4.26-1.43 11.16c.62 3.88 3.4 8.65 6.05 10.72 3.72 2.91 8.64 5.93 7.93 11.45-.67 5.18-7.55 7.5-11.02 7.71 1.58.26 3.19.37 4.78.32 11.81 0 20.58-8.78 20.58-18.12 0-7.39-3.54-10.43-5.62-12.43z" fill="#fff"/></svg>'
              : tipo2 == "Water"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M54 41.57s-3.96-6.86-5.85-9.78c-1.97-3.07-3.82-6.73-5.26-12.61-1.44-5.87-2.22-11.53-4.54-11.53s-3.1 5.65-4.54 11.53c-1.44 5.87-3.29 9.53-5.26 12.61-1.88 2.93-5.85 9.78-5.85 9.78a18.018 18.018 0 00-2.58 9.32c0 10.03 8.2 18.17 18.23 18.17s18.23-8.13 18.23-18.17c0-3.41-.95-6.59-2.58-9.32zM38.35 64.96c-8.18 0-14.61-6.1-14.61-10.5 0-2.91 6.43 2.52 14.61 2.52s14.61-5.43 14.61-2.52c0 4.41-6.43 10.5-14.61 10.5z" fill="#fff"/></svg>'
              : tipo2 == "Electric"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M37.97 6.94c2.5 1.14 12.84 6.04 19.84 12.22.31.27.34.75.07 1.06-1.55 1.8-6.66 7.75-12.82 14.99-.27.32-.24.8.07 1.08 1.8 1.59 7.48 6.69 10.91 10.43.28.3.26.77-.04 1.06-2.98 2.87-17.73 17.06-23.45 21.97-.3.26-.76-.02-.67-.41.74-3.02 2.8-11.05 4.99-16.89.12-.31.02-.66-.25-.86-2.15-1.64-11.56-8.86-17.74-14.4a.746.746 0 01-.16-.91c1.36-2.62 7.8-14.72 18.32-29.07.21-.29.6-.4.92-.25z" fill="#fff"/></svg>'
              : tipo2 == "Bug"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M38.35 28.23c8.1 0 15.19-3.44 19.07-8.57-3.88-6.28-10.97-10.49-19.07-10.49s-15.19 4.21-19.07 10.49c3.88 5.13 10.97 8.57 19.07 8.57zm22.84-4.26c-4.56 5.02-11.7 8.47-19.88 9.14l10.93 34.42c8.67-5.52 14.42-15.13 14.42-26.08 0-6.49-2.02-12.5-5.47-17.48zm-45.67 0c4.56 5.02 11.7 8.47 19.88 9.14L24.47 67.53C15.8 62.01 10.05 52.4 10.05 41.45c0-6.49 2.02-12.5 5.47-17.48zm22.83 30.75c1.66 0 3.31-.37 4.83-1.09l-1.3-4.74a6.554 6.554 0 01-7.07 0l-1.3 4.74c1.53.72 3.18 1.09 4.83 1.09zm0 9.14c2.53 0 4.98-.48 7.27-1.36l-1.33-4.85c-1.85.79-3.86 1.21-5.94 1.21s-4.08-.42-5.94-1.21l-1.33 4.85c2.29.88 4.74 1.36 7.27 1.36z" fill="#fff"/></svg>'
              : tipo2 == "Poison"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><g><path fill="#fff" d="M47.7 56.75c-.55-4.68-4.52-8.31-9.35-8.31s-8.8 3.63-9.35 8.31c-11.51.84-19.8 3.18-19.8 5.93 0 3.46 13.05 6.26 29.15 6.26s29.15-2.8 29.15-6.26c0-2.76-8.29-5.09-19.8-5.93z"/><circle fill="#fff" cx="28.31" cy="23.22" r="11.2"/><circle fill="#fff" cx="51.28" cy="37.57" r="6.64"/></g></svg>'
              : tipo2 == "Ground"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><g><path fill="#fff" d="M52.29 16.07h8.31v8.31h-8.31zm-24.44 6.49h6.48v6.48h-6.48zM13.55 8.92h10.81v10.81H13.55zm53.89 39.29V46.1L38.35 34.49 9.26 46.1v2.11l29.09 11.6 29.09-11.6z"/><path fill="#fff" d="M67.52 53.52L38.35 65.3 9.19 53.52l-1.47 3.64 30.63 12.38 30.64-12.38-1.47-3.64z"/></g></svg>'
              : tipo2 == "Fighting"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M40.72 34.03h21.8v9.88h-21.8v-9.88zm13.33-22v17.66h8.47V12.03h-8.47zm-4.86 0h-8.47v17.66h8.47V12.03zm-13.2 0h-8.47v23.22h8.47V12.03zm-13.33 0h-8.47v23.22h8.47V12.03zm14.03 31.43h-22.5v12.97l14.41 9.42 33.92-10.46v-7.38H36.69v-4.54z" fill="#fff"/></svg>'
              : tipo2 == "Psychic"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M38.35 16.28c.29 0 .59.16.72.48 2.62 6.29 8.79 10.32 15.47 10.32.71 0 1.43-.05 2.15-.14h.11c.63 0 1.01.73.61 1.26-4.58 5.98-4.58 14.34-.02 20.33.4.52.01 1.25-.61 1.25h-.11c-.72-.09-1.43-.14-2.14-.14-6.68 0-12.85 4.02-15.47 10.32-.13.32-.43.48-.72.48s-.59-.16-.72-.48C35 53.67 28.83 49.64 22.15 49.64c-.71 0-1.43.05-2.15.14h-.11c-.63 0-1.01-.73-.61-1.26 4.58-5.98 4.58-14.34.02-20.33-.4-.52-.01-1.25.61-1.25h.11c.72.09 1.43.14 2.14.14 6.68 0 12.85-4.02 15.47-10.32.13-.32.43-.48.72-.48m0-8.7c-3.84 0-7.28 2.29-8.75 5.84-1.23 2.96-4.22 4.96-7.44 4.96-.34 0-.68-.02-1.02-.07-.4-.05-.81-.08-1.22-.08-3.62 0-6.88 2.02-8.49 5.27a9.42 9.42 0 00.95 9.95c2.19 2.88 2.19 6.9 0 9.77a9.417 9.417 0 00-.97 9.96 9.407 9.407 0 008.49 5.28c.41 0 .82-.03 1.23-.08.34-.04.69-.07 1.03-.07 3.22 0 6.21 1.99 7.44 4.96 1.48 3.55 4.91 5.84 8.75 5.84s7.28-2.29 8.75-5.84c1.23-2.96 4.22-4.96 7.44-4.96.34 0 .68.02 1.02.07.4.05.81.08 1.22.08 3.62 0 6.88-2.02 8.49-5.27a9.42 9.42 0 00-.95-9.95c-2.19-2.88-2.19-6.9 0-9.77 2.21-2.89 2.58-6.7.97-9.96a9.407 9.407 0 00-8.49-5.28c-.41 0-.82.03-1.23.08-.34.04-.69.07-1.03.07-3.22 0-6.21-1.99-7.44-4.96a9.443 9.443 0 00-8.75-5.84z" fill="#fff"/></svg>'
              : tipo2 == "Dragon"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M12.39 23.98c-8.41 11.05-7.23 26.81 3.02 36.47 1.09-3.6 3.14-6.95 6.1-9.6a20.91 20.91 0 01-4.04-10.48c-5.13-3.92-7-10.56-5.08-16.4zm51.92 0c1.92 5.84.05 12.48-5.08 16.4-.38 3.88-1.82 7.47-4.04 10.48 2.96 2.65 5.01 5.99 6.1 9.6 10.25-9.65 11.43-25.42 3.02-36.47zm-12.95 1.33c-1.12-7.41-3.63-15.73-4.89-19.64-.22-.68-1.26-.66-1.44.03-1.17 4.28-2.6 11.09-3.24 14.2-1.07-.2-2.29-.32-3.42-.32s-2.35.11-3.42.32c-.64-3.11-2.07-9.91-3.24-14.2-.19-.69-1.22-.72-1.44-.03-1.26 3.91-3.78 12.22-4.89 19.64-2.67 2.99-4.3 6.93-4.3 11.33 0 6.35 3.37 13.85 8.39 18.21l1.38 12.27c0 1.8 3.37 4.41 7.53 4.41s7.53-2.62 7.53-4.41l1.38-12.27c5.02-4.36 8.39-11.86 8.39-18.21 0-4.4-1.63-8.34-4.3-11.33zM29.81 48.82c-2.98-.92-5.06-3.61-5.15-6.73-.12-3.67.07-7.59.07-7.59l9.2 15.41c-1.61-.37-2.97-.74-4.12-1.09zm17.1 0c-1.14.35-2.51.73-4.12 1.09l9.2-15.41s.19 3.92.07 7.59a7.285 7.285 0 01-5.15 6.73z" fill="#fff"/></svg>'
              : tipo2 == "Rock"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path fill="#fff" d="M58.71 18l2.67 11.72-14.39-14.39L58.71 18l-8.43-8.43H26.43L9.57 26.43v23.85l8.23 8.23-4.49-19.72L37.52 63 17.8 58.51l8.63 8.63h23.85l8.43-8.43-19.72 4.49L63.2 38.99l-4.49 19.72 8.43-8.43V26.43L58.71 18z"/></svg>'
              : tipo2 == "Ice"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><g><path fill="#fff" transform="rotate(-45 38.354 11.743)" d="M33.44 6.82h9.83v9.83h-9.83z"/><path fill="#fff" d="M11.49 48.24h9.83v9.83h-9.83z"/><path fill="#fff" transform="rotate(-45 38.353 64.974)" d="M33.44 60.05h9.83v9.83h-9.83z"/><path fill="#fff" d="M55.38 18.75v9.77l-17.03-9.83-17.03 9.83v-9.77h-9.83v9.83h9.83v19.6l17.03 9.83 17.03-9.83v-19.6h9.83v-9.83h-9.83zM31.14 34.32v9.62h-5.11v-12.6h.05l10.86-6.27 2.55 4.42-8.36 4.83zm24.24 13.92h9.83v9.83h-9.83z"/></g></svg>'
              : tipo2 == "Dark"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><g><path fill="#fff" d="M60.1 20.73s-3.25 4.41-10.78 6.74c.84 2.28 1.32 4.93 1.32 7.9 0 10.15-5.5 18.39-12.28 18.39s-12.28-7.27-12.28-18.39c0-2.95.58-5.58 1.52-7.84-7.67-2.32-10.98-6.8-10.98-6.8s-7.54 8.04-6.83 17.19c.42 5.33 3.3 11.6 10.35 17.38 0 0 7.54 6.66 18.22 6.66s18.22-6.66 18.22-6.66c7.05-5.78 9.93-12.04 10.35-17.38.72-9.15-6.83-17.19-6.83-17.19z"/><path fill="#fff" d="M35.54 28.85c-.96 2-1.58 4.89-1.58 7.72 0 5.08 1.97 9.19 4.39 9.19s4.39-4.12 4.39-9.19c0-2.84-.61-5.73-1.58-7.72-.9.04-1.84.05-2.81.02-.97.03-1.91.02-2.81-.02z"/></g></svg>'
              : tipo2 == "Steel"?  '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><defs><style>.cls-1{fill:#fff}</style></defs><g xmlns="http://www.w3.org/2000/svg"><path class="cls-1" d="M41 27.35l9.18 32.02 17.37-12.62-8.03-24.71L41 27.35zM52.3 37.6c-2.52 0-4.56-2.04-4.56-4.56s2.04-4.56 4.56-4.56 4.56 2.04 4.56 4.56-2.04 4.56-4.56 4.56z" style="fill: white;"/><path class="cls-1" d="M37.9 38.21l-4.29-14.95 24.07-6.9-1.28-3.93H20.3L9.15 46.75l28.75-8.54zM26.03 15.23c1.87 0 3.38 1.51 3.38 3.38s-1.51 3.38-3.38 3.38-3.38-1.51-3.38-3.38 1.51-3.38 3.38-3.38zm13.01 26.95l-25.69 7.63 25 18.17 6.69-4.87-6-20.93z" style="&#10;    fill: white;&#10;"/></g></svg>'
              : tipo2 == "Flying"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M23.78 27.7c-1.94 4.43-7.5 23.12-8.81 33.15-.67 5.09-1.31 6.86 0 7.25 1.66.5 8.65-10.31 11.14-14.47 0 0 15.92 2.39 24.09-7.79.19-.24-.02-.59-.32-.53-3.22.55-14.81 2.34-19.94.35 0 0 20.89.81 30.38-14.67.13-.2-.08-.46-.3-.38-3.29 1.19-17.5 5.86-26.01 3.66 0 0 13.83-.81 24.28-10.31S69.6 9.66 68.85 8.91c-1.42-1.42-8.65 2.16-14.47 3.99s-13.14 3.99-17.96 4.99-8.81 1.08-12.64 9.81z" fill="#fff"/></svg>'
              : tipo2 == "Fairy"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M66.36 12.08c-2.18-2.18-15.61-3.16-24.65 5.88-1.55 1.55-2.63 3.4-3.25 5.35-.62-1.96-1.7-3.8-3.25-5.35-9.04-9.04-22.47-8.06-24.65-5.88S7.4 27.69 16.44 36.73c1.91 1.91 4.26 3.11 6.73 3.61-5 4.33-5.57 11.18-4.61 12.52 1.02 1.42 8.4 3.21 14.31-.94-.27.79-.53 1.6-.79 2.44-2.47 8.08-3.39 14.96-2.07 15.36 1.33.41 4.41-5.81 6.88-13.89.62-2.03 1.15-3.99 1.56-5.79.41 1.8.94 3.76 1.56 5.79 2.47 8.08 5.55 14.3 6.88 13.89 1.33-.41.4-7.29-2.07-15.36-.26-.84-.52-1.65-.79-2.44 5.91 4.15 13.3 2.36 14.31.94.96-1.34.39-8.18-4.61-12.52 2.47-.5 4.82-1.7 6.73-3.61 9.04-9.04 8.06-22.47 5.88-24.65zm-27.9 28.05c-4.31 0-8.04-2.45-9.9-6.03 5.01-.02 9.15-3.74 9.81-8.57.02-.12.17-.12.18 0 .66 4.83 4.8 8.56 9.81 8.57-1.86 3.58-5.59 6.03-9.9 6.03z" fill="#fff"/></svg>'
              : tipo2 == "Ghost"? '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M64.73 37.52c-2.45-.58-4.47.48-5.75 1.48.49-2.06.77-4.09.77-6.02 0-11.82-9.58-21.4-21.4-21.4s-21.4 9.58-21.4 21.4c0 1.93.28 3.96.77 6.02-1.28-.99-3.31-2.06-5.75-1.48-3.51.83-6.4 5.88-6.57 10.24-.03.9 1.07 1.36 1.67.69.97-1.09 2.24-2.21 3.12-1.84 2.88 1.22 3.1 6.32 5.87 6.32 2.43 0 4.52-2.43 5.54-3.86 4.66 8.79 11.84 16.06 16.74 16.06s12.07-7.26 16.74-16.06c1.02 1.43 3.11 3.86 5.54 3.86 2.77 0 2.99-5.1 5.87-6.32.88-.37 2.15.74 3.12 1.84.6.67 1.71.21 1.67-.69-.17-4.36-3.06-9.41-6.57-10.24zm-31.59-2.74c-1.78.83-4.48-1.18-6.03-4.5-1.55-3.32-1.35-6.68.43-7.51 1.78-.83 4.48 1.18 6.03 4.5 1.55 3.32 1.36 6.68-.43 7.51zm16.45-4.5c-1.55 3.32-4.25 5.33-6.03 4.5-1.78-.83-1.98-4.2-.43-7.51 1.55-3.32 4.25-5.33 6.03-4.5 1.78.83 1.98 4.2.43 7.51z" fill="#fff"/></svg>'
              : '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 76.71 76.71"><path d="M63.81 26.43c3.12-4.29 2.43-10.33-1.69-13.79-4-3.36-9.82-3.11-13.54.39-3.18-1.21-6.63-1.88-10.23-1.88s-7.05.67-10.23 1.88c-3.71-3.5-9.53-3.74-13.54-.39-4.13 3.46-4.81 9.49-1.69 13.79-2.17 4.05-3.4 8.67-3.4 13.58 0 15.91 12.95 28.86 28.86 28.86s28.86-12.95 28.86-28.86c0-4.91-1.23-9.53-3.4-13.58zM38.35 60.87c-11.5 0-20.86-9.36-20.86-20.86s9.36-20.86 20.86-20.86 20.86 9.36 20.86 20.86-9.36 20.86-20.86 20.86z" fill="#fff"/></svg>',
              width: 20, 
              height: 20,
              fit:BoxFit.fill,
              color:Colors.white
            ),
            SizedBox(width: 3,),
            Text(
            getDataController.getDataModel.value.results[index].pokTipo2.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              shadows: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 1), // X - Y
                )
              ]
            ),
            ),
          ],
        )
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Color.fromARGB(83, 0, 0, 0),
      ),
    );
  }
  
}