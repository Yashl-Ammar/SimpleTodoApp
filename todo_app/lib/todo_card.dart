import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
/*  final ValueChanged<bool?>? onChanged;*/
  final String text;
  //bool ischecked = false;

  TodoCard({required this.text});



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListTile(
        title: Text(text),
        leading: const Icon(CupertinoIcons.suit_diamond_fill,
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}
