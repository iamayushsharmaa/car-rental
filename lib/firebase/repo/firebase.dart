
import 'package:firebase_auth/firebase_auth.dart';

signUp(String email, String password) async {
  try {
    UserCredential _userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password ,
    );
  } on FirebaseAuthException catch (e) {
    if(e.code == "weak-password"){
      print('the password is too weak');
    }else if(e.code == "email-already-in-use"){
      print('the account already exists for that email');
    }
  }catch(e){
    print(e);
  }
}