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
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: <Widget>[
          Image.asset(widget.item.mini.toString()),
          Text(widget.item.title.toString()),
        ],
      ),
    );
  }
}