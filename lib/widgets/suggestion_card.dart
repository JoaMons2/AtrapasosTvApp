import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: const Image(
            image: AssetImage('assets/images/8.png'),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          children: [
            SizedBox(
              width: 300,
              height: 50,
              child: Text(
                'Atrapados en el Tiempo',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(
              width: 300,
              height: 80,
              child: Text(
                'No somos los unicos en este universo, existen millones de galaxias con diversa humanidad y no humanidad',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: Text(
                'Fecha: 10/08/2023',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: Text(
                'Duración: 15:56',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        )
      ],
    );
  }
}