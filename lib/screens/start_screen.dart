
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kc_tv_app/model/items.dart';
import 'package:kc_tv_app/screens/list_screen.dart';
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
  int _randomIndex = 0;
  int _selectedIndex = 0;

  // Fetch content from the json file
  Future<void> readJson(String fileName, String key, Function callback) async {
  try {
      //print('Reading $fileName.json');
      final String response = await rootBundle.loadString('assets/jsons/$fileName.json');
      final data = await json.decode(response);
      //print('Data from $fileName.json: $data');
      //print('Data from $fileName.json has ${data[key].length} items');
      callback(data[key]);
      // setState(() {
      //   callback(data[key]);
      // });
      //print('Finished reading $fileName.json');
      if (data[key].isEmpty) {
            print('$key list is empty');
      } else if (!data[key][0].containsKey('title')) {
            print('First element in $key list does not have a title property');
      } else {
            // Access the title property here
            print(data[key][0]['title']);
      }
    } catch (e) {
    print('Error while reading $fileName.json: $e');
  }
}

  @override
  void initState() {
    super.initState();

    // Getting a random index of the items for the recommendations
    Random random = Random();
    _randomIndex = random.nextInt(2)+1;
  }

  @override
  Widget build(BuildContext context) {
    Items itemsSelected = Items();
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
                  ]).catchError((error) {
                      // Maneja el error aquí
                      //print(error);
                      return [];
                  }),
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        // Muestra un mensaje de error
                        return const Text('Ocurrió un error al cargar los datos'); 
                      } else {
                          //print(_itemsAliens.items[1].title);
                          return SuggestionCard(item: _itemsAliens.items[_randomIndex]);
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items:  const <BottomNavigationBarItem>[
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
        onTap: (index) {
          print('index: $index');

          if (index == 0) {
            itemsSelected = _itemsAliens;
          } else if (index == 1) {
            itemsSelected = _itemsViajeros;
          } else if (index == 2) {
            itemsSelected = _itemsUniversos;
          }
          setState(() {
            _selectedIndex = index;
            itemsSelected = itemsSelected;
        });
        print('SelectedIndex: $_selectedIndex');
        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListScreen(listItems: itemsSelected)));
          //Navigator.of(context).pushNamed('ListScreen', arguments: itemsSelected);
        },
      ),
    );
  }
}