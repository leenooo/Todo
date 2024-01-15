import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "All ToDos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ListTile(
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.restore_from_trash)),
                leading: Checkbox(value: false, onChanged: (value) {}),
              ),
            ],
          ),
        ));
  }
}
