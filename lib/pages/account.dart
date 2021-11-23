import 'package:flutter/material.dart';

class DontHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const DontHaveAnAccount({
    Key? key, 
    this.login = true, 
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(login ? "Don't have an Acount ?  " : "Already have an Acount ?   ", style: const TextStyle(fontWeight: FontWeight.bold),),
        
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            color: Colors.white,
            child: Text(
              login ? "Signup Now" : "Sign In",
              style: const TextStyle(color: Colors.blueAccent, fontSize: 15,
                ),
            ),
            onPressed: press(),
          ),
        )
      ],
    );
  }
}
