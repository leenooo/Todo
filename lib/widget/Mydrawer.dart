import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
