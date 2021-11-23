import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  
  final FirebaseAuth _firebaseAuth;
  
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();

  }

  Future<String?> signIn({required String email1, required String password1}) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email1, password: password1);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } 
  }

  Future<String?> signUp({required String email1, required String password1}) async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email1, password: password1);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } 
  }
}