import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
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
                Text("Remember me?"),
              ],
            ),
            Center(
                child: ElevatedButton(onPressed: () {}, child: Text("Login"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot password",
                  style: TextStyle(color: Colors.grey[400]),
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
              children: [
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {},
                    icon:
                        Icon(Icons.g_mobiledata_rounded, color: (Colors.red))),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook, color: (Colors.blue))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
