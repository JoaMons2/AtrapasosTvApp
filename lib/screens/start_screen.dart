import 'package:flutter/material.dart';
import 'package:kc_tv_app/widgets/suggestion_card.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset('assets/images/icon.jpg'),
        ),
        title: Text(
          'Atrapados en el Tiempo Tv',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RECOMENDADO PARA TI',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SuggestionCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: Color.fromARGB(255, 255, 255, 255),),
            label:  'Últimos videos',
           // backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library,
            color: Color.fromARGB(255, 255, 255, 255),),
            label:  'Galeria',
           // backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people,
            color: Color.fromARGB(255, 255, 255, 255),),
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