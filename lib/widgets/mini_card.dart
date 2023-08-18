import 'package:flutter/material.dart';
import 'package:kc_tv_app/model/item.dart';

class MiniCard extends StatefulWidget {

  final Item item;

  const MiniCard({super.key, required this.item});

  @override
  State<MiniCard> createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 150,
      child: Card(
        color: const Color.fromARGB(255, 33, 35, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: <Widget>[
            Image.asset(widget.item.mini.toString()),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.title.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20,),
                Text(
                  'Fecha:  ${widget.item.date.toString()}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                Text(
                  'Duración:  ${widget.item.duration.toString()}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}