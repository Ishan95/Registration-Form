import 'package:flutter/material.dart';
import 'package:registration_form/color.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String firstname;
  late String secondName;
  late String email;
  late String password;
  late String confirmPassword;

  Widget _buildFNameField() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(labelText: 'First Name', hintText: 'Enter Your First Name'),
      onSaved: (value) {
        firstname = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }
  Widget _buildSNameField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(labelText: 'Second Name', hintText: 'Enter your Second Name'),
      onSaved: (value) {
        secondName = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }
  Widget _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (text) {
        return HelperValidator.emailValidate(text!);
      },
      decoration: InputDecoration(labelText: 'Email', hintText: 'Enter your Email'),
      onSaved: (value) {
        email = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }
  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      validator: (text) {
        return HelperValidator.passwordValidate(text!);
      },
      decoration: InputDecoration(labelText: 'Password', hintText: '*****'),
      onSaved: (value) {
        password = value!;
      },
      textInputAction: TextInputAction.next,
    );
  }
  Widget _buildConformPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Conform Password', hintText: '*****'),
      onSaved: (value) {
        confirmPassword = value!;
      },
      textInputAction: TextInputAction.done,
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.08),
                const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildFNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildSNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildEmailField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildPasswordField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildConformPasswordField(),
                ),
                SizedBox(height: size.height * 0.08),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    width: size.width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),                       
                        color: backColor,
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => Welcomepage()));
                          

                        },
                        child: const Text(
                          "SIGNUP",
                          style: TextStyle(color: Colors.white, fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class HelperValidator {
  
  static String? emailValidate(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }

  static String? passwordValidate(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }

}