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
            image: AssetImage('assets/images/ep1_viajero.png'),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          children: [
            SizedBox(
              width: 300,
              height: 70,
              child: Text(
                'VIAJEROS EN EL TIEMPO: JOHN TITOR',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: Text(
                'John Titor: fue uno de los primeros viajeros en el tiempo del nuevo milenio, sus predicciones y revelaciones hicieron dudar a más de uno.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: Text(
                'Fecha: 30/06/2018',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              width: 300,
              height: 25,
              child: Text(
                'Duración: 07:27',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        )
      ],
    );
  }
}