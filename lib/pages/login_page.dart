import 'package:flutter/material.dart';
import 'package:flutter_catalogue/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "img/itachi.jpg",
              fit: BoxFit.cover,
              height: 300,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter You Username",
                        labelText: "Username",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter You Email",
                        labelText: "Email",
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter You Password",
                        labelText: "Password",
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter You Password",
                        labelText: "Confirm Password",
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
