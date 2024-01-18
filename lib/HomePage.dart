import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController additem = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                tooltip: 'Logout ',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 139, 182, 202),
                          title: Text(
                            "Are you sure?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Color.fromARGB(255, 139, 182, 202),
          title: Text(
            "All ToDos",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 139, 182, 202),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Icon(Icons.person),
                ),
                ListTile(
                  onTap: () {
                    //  Navigator.pushReplacement(
                    //  context,
                    // MaterialPageRoute(builder: (context) => const ContactPage()),
                  },
                  title: const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 139, 182, 202),
          hoverColor: Colors.white,
          splashColor: const Color.fromARGB(255, 224, 160, 181),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 139, 182, 202),
                      title: Text(
                        "Write your plans?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      content: TextField(
                        controller: additem,
                        maxLength: 50,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.white,fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: Text(
                              "cancel",
                              style: TextStyle(color: Colors.white,fontSize: 15),
                            ),
                          ),
                        ),
                      ]);
                });
          },
          tooltip: 'Add item ',
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
              
              Expanded(
                child: ListView.builder(itemCount: 4, itemBuilder: (context, index) {
                  return  ListTile(
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.restore_from_trash,
                        color: Colors.red,
                      ),
                    ),
                    leading: Checkbox(value: false, onChanged: (value) {}),
                  );
                },
                 
                ),
              )
            ],
          ),
        ));
  }
}
