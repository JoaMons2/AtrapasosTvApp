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
          child: Image.asset('assets/images/8.png'),
        ),
        title: Text(
          'Atrapados Tv',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recomendado para ti',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SuggestionCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label:  'Últimos videos',
            backgroundColor: Color.fromARGB(255, 2, 50, 72),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label:  'Galeria',
            backgroundColor: Color.fromARGB(255, 2, 50, 72),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label:  'Comunidad',
            backgroundColor: Color.fromARGB(255, 2, 50, 72),
          ),
        ],
        backgroundColor: Colors.blue,
        onTap: null,
        ),
      );
  }
}