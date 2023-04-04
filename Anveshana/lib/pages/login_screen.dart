import 'package:flutter/material.dart';
import 'package:anveshana/pages/home.dart';
import 'package:anveshana/pages/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

//firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {


    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },


        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,

        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },

        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));


    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromRGBO(44, 54, 243, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: () {
          signIn(emailController.text, passwordController.text);
          },
        child: Text("Login", textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(


            child: SingleChildScrollView(
                child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Form(


                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(

                                child: Image.asset("assets/prad.png")
                            ),
                            SizedBox(height: 10),

                            emailField,
                            SizedBox(height: 25),
                            passwordField,
                            SizedBox(height: 35),
                            loginButton,
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Text("Don't have an account?"),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                                  },
                                  child: Text("Signup",
                                    style: TextStyle(color: Color.fromRGBO(44, 54, 243, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                )


            )
        ),

        bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(10.0),
            child: Container(

            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(118,209, 182, 1),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ) ,
                onPressed: () {Navigator.pushNamed(context, '/doc');},
                icon: Icon( Icons.medical_services_outlined,
                  size: 30.0,
                ),
                label: Text('Doctor'), // <-- Text
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(232,178, 73, 1),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ) ,
                onPressed: () {Navigator.pushNamed(context, '/col');},
                icon: Icon(Icons.handshake_sharp,
                  size: 30.0,
                ),
                label: Text('Collector'), // <-- Text
              ),
            ],),),
    ),
    );
  }

//login function

    void signIn(String email, String password) async {
      if (_formKey.currentState!.validate()) {

        await _auth.signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {

          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen())),

        }).catchError((e)
            {
              Fluttertoast.showToast(msg: e!.message);
            });
      }
    }
  }




