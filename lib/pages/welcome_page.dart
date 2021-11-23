import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:registration_form/services/authentication_service.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({ Key? key }) : super(key: key);

  @override
  _WelcomepageState createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // SizedBox(
              //   height: 180,
              //   child: Image.asset("assets/images/welcome.png",fit: BoxFit.contain),
              // ),
              Text("Welcome Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              
              SizedBox(height: size.height * 0.08),

              Text("Name", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
              
              Text("Email", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),

              SizedBox(height: size.height * 0.08),

              ActionChip(label: Text("Logout"), onPressed: (){
                context.read<AuthenticationService>().signOut();
              })
            ],
          ),
        ),
      ),
    );
  }
}