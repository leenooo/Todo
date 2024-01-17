import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "هل انت متأكد؟",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                "نعم",
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text(
                                "لا",
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(Icons.logout))
          ],
          backgroundColor: Colors.grey,
          title: Text("All ToDos"),
          centerTitle: true,
        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'اضافة عنصر',
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "My Tasks ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.restore_from_trash,
                        color: Colors.red,
                      )),
                  leading: Checkbox(value: false, onChanged: (value) {}),
                ),
              ],
            ),
          ),
        ));
  }
}
