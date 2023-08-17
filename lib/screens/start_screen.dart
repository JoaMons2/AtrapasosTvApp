
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kc_tv_app/model/items.dart';
import 'package:kc_tv_app/widgets/suggestion_card.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  Items _itemsAliens = Items();
  Items _itemsViajeros = Items();
  Items _itemsUniversos = Items();
  int _index = 0;

  // Fetch content from the json file
  Future<void> readJson(String fileName, String key, Function callback) async {
  final String response = await rootBundle.loadString('assets/jsons/$fileName.json');
  //final String response = await rootBundle.loadString('assets/jsons/$fileName.json');
  final data = await json.decode(response);
  setState(() {
    callback(data[key]);
  });
}

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts

    // Getting a random index of the items for the recommendations
    Random random = Random();
    _index = random.nextInt(2)+1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            'assets/images/icon.jpg',
          ),
        ),
        title: Text(
          'Atrapados en el Tiempo Tv',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recomendado para ti',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20,),
            FutureBuilder(
                  future: Future.wait([
                      readJson('aliens', 'aliens', (data) => _itemsAliens = Items.fromJsonList(data)),
                      readJson('viajes', 'items', (data) => _itemsViajeros = Items.fromJsonList(data)),
                      readJson('universos', 'capitulos', (data) => _itemsUniversos = Items.fromJsonList(data)),
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      print(_itemsAliens.items[0].title);
                      return SuggestionCard(item: _itemsAliens.items[0]);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: Color.fromARGB(255, 255, 255, 255),
          ),
            label:  'Últimos videos',
           // backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
            label:  'Galeria',
           // backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
            label:  'Comunidad',
            //backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
        backgroundColor:const Color.fromARGB(255, 3, 3, 40),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedLabelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
        fixedColor: const Color.fromARGB(255, 255, 255, 255),
        onTap: null,
      ),
    );
  }
}