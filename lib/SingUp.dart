import 'package:flutter/material.dart';
import 'package:todo/Login.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      //  backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SingUp",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Email"),
            TextField(
              maxLength: 30,
              controller: email,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email), border: OutlineInputBorder()),
            ),
            Text(
              "Password",
            ),
            TextField(
              maxLength: 15,
              controller: password,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.key), border: OutlineInputBorder()),
            ),
            Center(
                child: SizedBox(
                    width: 200,
                    height: 35,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 87, 173, 220))),
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        )))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(color: Colors.grey[300]),
                ),
                SizedBox(
                  width: 100,
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata_rounded,
                        color: (Colors.white))),
                IconButton(
                    /*style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),*/
                    onPressed: () {},
                    icon: Icon(Icons.facebook_sharp,
                        size: 45, color: (Colors.blue))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already a user ?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'Login',
                      style:
                          TextStyle(color: Color.fromARGB(255, 87, 173, 220)),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
