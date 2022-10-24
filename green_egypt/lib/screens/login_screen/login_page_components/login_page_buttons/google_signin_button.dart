import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/firebase_services/google_auth.dart';

class GoogleSignInButton extends StatelessWidget {
  /**
   * Google Sign in button is running with these Steps :
   * 1- Try logging with Google Account 
   * if accepted .. store user data in UserInfo and store logged in UserLoggedController
   * else .. show error in Toast
   */
  const GoogleSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Google SIgn in Button
     */
    return ElevatedButton(
      /**
       * Button Styling
       */
      style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      /**
           * on pressed
           */
      onPressed: () async {
        try {
          /**
           * First Fetch data from online Firestore
           */
          await GoogleAuth.signInWithGoogle().then((data) async {
            /**
             * Second store all user data in UserDataModel with number = ""
             * Number will be changed from user account setting inside application .
             */
            await UserDataModel.initiateUserDataModel(
                // initiate user email .
                email: data.user!.email!,
                // initiate user name .
                name: data.user!.displayName!,
                // initiate user image url .
                imageUrl: data.user!.photoURL!,
                // initiate user number with default value : "" .
                userPhoneNumber: "");
            // after all these configrations finished , move to HomePage() .
          }).then((value) => Get.offNamed(PagesNames.homePage));
        } on FirebaseAuthException catch (e) {
          CustomToast.showRedToast(messsage: e.code);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .12,
            ),
            Image(
              width: MediaQuery.of(context).size.width * .08,
              height: MediaQuery.of(context).size.height * .04,
              image: AssetImage("assets/icons/google.png"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .05,
            ),
            Text(
              "Sign with Google",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
