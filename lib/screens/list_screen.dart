import 'package:flutter/material.dart';
import 'package:kc_tv_app/model/items.dart';
import 'package:kc_tv_app/widgets/mini_card.dart';


class ListScreen extends StatefulWidget {

  final Items listItems; 

  const ListScreen({super.key, required this.listItems});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            "assets/images/kc_white_on_red.png",
          ),
        ),
        title: Text(
          'KC Tv',
          style: Theme.of(context).textTheme.headlineLarge,
          ),
      ),
      body: ListView(
        children:  [
          MiniCard(item: widget.listItems.items[0]),
        ],
      ),
    );
  }
}