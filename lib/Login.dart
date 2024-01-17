import 'package:flutter/material.dart';
import 'package:todo/SingUp.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/images/todo11.jpg"))),
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Email"),
              TextField(
                maxLength: 30,
                controller: email,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder()),
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
                    fillColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 87, 173, 220)),
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
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 173, 220)),
                          )))),
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
                              MaterialStatePropertyAll(Colors.red)),
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
                  Text('Need an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SingUp()));
                      },
                      child: Text(
                        'SingUp',
                        style:
                            TextStyle(color: Color.fromARGB(255, 87, 173, 220)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
