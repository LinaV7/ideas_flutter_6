import 'package:flutter/material.dart';

class IdeasDetail extends StatelessWidget {
  const IdeasDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ideaFromPage1 = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: Text(ideaFromPage1),
          actions: [
            GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () {
                Navigator.pop(context, ideaFromPage1);
              },
            ),
          ],
        ),
        body: Center(
          child: TextField(
            onSubmitted: (value) {
              Navigator.pop(context, value);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.light),
              labelText: ideaFromPage1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ));
  }
}
