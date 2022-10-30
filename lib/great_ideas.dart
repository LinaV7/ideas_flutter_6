import 'package:flutter/material.dart';

class GreatIdeas extends StatefulWidget {
  const GreatIdeas({Key? key}) : super(key: key);

  @override
  State<GreatIdeas> createState() => _GreatIdeasState();
}

class _GreatIdeasState extends State<GreatIdeas> {
  Set<String> ideas = {};
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Great ideas'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Center(
              child: Text(
                "What's on your mind?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/images/paper.png',
                width: 150, height: 100, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: textEditingController,
              onSubmitted: (String value) {
                setState(() {
                  ideas.add(value);
                  textEditingController.clear();
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.local_fire_department),
                labelText: 'Idea',
                hintText: 'Enter new idea',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.transparent),
              itemCount: ideas.length,
              itemBuilder: ((context, index) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(99, 146, 195, 247),
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: ListTile(
                    title: Text(ideas.elementAt(index)),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/ideas-detail',
                        arguments: ideas.elementAt(index),
                      );
                    },
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
