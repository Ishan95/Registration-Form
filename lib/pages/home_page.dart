import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:registration_form/color.dart';
import 'package:registration_form/pages/registration_page.dart';
import 'package:registration_form/services/authentication_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    final passwordField = TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock, color: backColor),
                        hintText: "******",
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: backColor,
                        ),
                      border: InputBorder.none,
                      ),
                      autofocus: false, 
                      controller: password,
                      onSaved: (value){
                        password.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      
                    );

    final emailField = TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email, color: backColor),
                        hintText: "Email",
                      ),
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      
                      onSaved: (value){
                        email.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                    
    );

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.2),
                  const Text(
                    "Login Form",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                  ),
                  SizedBox(height: size.height * 0.1),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: backLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    width: size.width * 0.8,
                    child: Column(
                      children: [
                        emailField,
                      ]
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: backLightColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    width: size.width * 0.8,
                    child: Column(
                      children: [
                        passwordField,
                      ]
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),

                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: size.width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),                       
                        color: backColor,
                        onPressed: (){
                          context.read<AuthenticationService>().signIn(
                            email1: email.text.trim(),
                            password1: password.text.trim(),
                          );
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  
                  SizedBox(height: size.height * 0.05),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Acount ?  ", style: TextStyle(fontWeight: FontWeight.bold),),
                      
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                        },
                        child: const Text(
                          " SignUp ", 
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600, 
                            fontSize: 15
                          ),
                        ),
                      ),
                    ],
                  ), 
                ],
              ),
        ),
      ),
    );
  }
}
