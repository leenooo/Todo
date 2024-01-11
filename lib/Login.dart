import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LOGIN",
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
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Text("Remember me"),
              ],
            ),
            Center(
                child: SizedBox(
                    width: 200,
                    height: 35,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Login")))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Forgot password",
                      style: TextStyle(color: Colors.grey[400])),
                ),
              ],
            ),
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
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {},
                    icon:
                        Icon(Icons.g_mobiledata_rounded, color: (Colors.red))),
                IconButton(
                    /*style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),*/
                    onPressed: () {},
                    icon: Icon(Icons.facebook_sharp, color: (Colors.blue))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
