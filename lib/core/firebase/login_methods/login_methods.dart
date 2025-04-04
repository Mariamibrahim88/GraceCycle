import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grace_cycle/core/database/local/cache_helper.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/service/service_locator.dart';

class LoginMethods {
  static Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // print(googleUser!.email.toString());
      // print(googleUser.displayName.toString());
      // print(googleUser.toString());

      if (googleUser == null) {
        return Future.error("Error signing in with Google: User is null");
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      //Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      await sl<CacheHelper>()
          .writeSecureData(key: ApiKeys.email, value: googleUser.email);
      await sl<CacheHelper>().writeSecureData(
          key: ApiKeys.name, value: googleUser.displayName ?? '');

      // Obtain the auth details from the request
      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser?.authentication;

      // Create a new credential
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.accessToken,
      //   idToken: googleAuth?.idToken,
      // );

      // Once signed in, return the UserCredential
      //return await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
      return userCredential;
    } catch (e) {
      throw Exception("Error signing in with Google: ${e.toString()}");
    }
  }
}
