import 'package:flutter/material.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  String name = "";
  bool changeButton = false;

  final formkey = GlobalKey<FormState>();

  Movetologin(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/img/itachi.jpg",
                fit: BoxFit.cover,
                height: 300,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome $name',
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter You Email",
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter You Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password should as long as greter than 6 letters";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter You Password",
                          labelText: "Confirm Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password should as long as greter than 6 letters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => Movetologin(context),
                          // Ink or Conatiner both are same but ink provides additional decoration feature rather than container
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            // color: Colors.deepPurple,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Signup',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            decoration: BoxDecoration(
                                // color: Colors.deepPurple,
                                // shape: changeButton
                                //     ? BoxShape.circle
                                //     : BoxShape.rectangle,
                                // borderRadius:
                                //     BorderRadius.circular(changeButton ? 50 : 8)
                                ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // MainAxisAlignment:MainAxisAlignment.Center,
                            'Already have an account ?'.text.make(),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.loginRoute);
                                },
                                child: 'login'
                                    .text
                                    .color(context.accentColor)
                                    .make())
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
