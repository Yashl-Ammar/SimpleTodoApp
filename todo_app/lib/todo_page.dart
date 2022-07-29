import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'constants.dart';
import 'todo_card.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  List<bool> allBool = [];

  TodoCard cardGenerator(String text)
  {
    return TodoCard(
      text: text,
    );
  }

  List<TodoCard> allCards = [];

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'TODO',
            style: kTitleStyle,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter a TODO',
                  suffixIcon: GestureDetector(
                    onTap:(){
                      if(myController.text == '')
                      {
                        Alert(
                          style: AlertStyle(
                            alertElevation: 0.0,
                            alertBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            titleStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            descStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          context: context,
                          title: "Add a todo",
                          desc: "Can't add a todo with out any text",
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                              child: const Text(
                                "ok",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ).show();
                      }
                      else {
                        setState(() {
                          allCards.add(
                            cardGenerator(myController.text),
                          );
                        });
                      }
                    },
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  )
              ),
            ),
          ),
          Column(
            children: allCards,
          )
        ],
      ),
    );
  }
}


