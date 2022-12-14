import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';

class RegisterPageController extends GetxController {
  var validationMode = AutovalidateMode.disabled;
  bool securePassword = true;
  String userCredintial = "normal_user";
  FaIcon eyeIcon = FaIcon(FontAwesomeIcons.eyeSlash);
  Color eyeIconColor = Colors.grey;

  SignUpPageController() {
    eyeIcon = FaIcon(
      FontAwesomeIcons.eyeSlash,
      color: eyeIconColor,
    );
  }

  void chageUserCredintial(String newCategory) {
    userCredintial = newCategory;
    update();
  }

  void changeShowPasswordValue() {
    securePassword = !securePassword;
    if (securePassword == true) {
      eyeIconColor = Colors.grey;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eyeSlash,
        color: eyeIconColor,
      );
    } else {
      eyeIconColor = Colors.green;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eye,
        color: eyeIconColor,
      );
    }

    update();
  }

  void changeValidationMode() {
    /**
     * Keep tracking user input and validate it immediatly !! 🔥🤍
     */
    validationMode = AutovalidateMode.onUserInteraction;
    update();
  }

  Future<void> registerNewUser(
      {required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController,
      required String userCategory,
      required TextEditingController firstNameController,
      required TextEditingController lastNameController,
      required TextEditingController userNumberController}) async {
    /**
             * ############################## To remeber how it work #############################
             * Visit : https://tech-mavica.notion.site/Green-Egypt-Docs-73034b5905e444c2ae85761ff20a4d6f
             */
    try {
      /**
       * Show loading Indicator
       */
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          });
      /**
           * Regsiter New User 
           */
      FirebaseCustomServices.registerNewUser(
              email: emailController.text,
              password: passwordController.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              userNumber: userNumberController.text,
              userCredintial: userCredintial)
          .then((value) {
                   /**
                     * Remove loading indicator
                     */
              Get.back();
              /**
                * Show animted success vector
                */
              // TODO : show success animation .
             showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 3), () {
                          /**
                        * Remove Success Animation
                        */
                          Get.back();
                          /**
                         * Navigate to Home Screen 
                         */
                          Get.offNamed(PagesNames.homePage);
                        });
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Lottie.asset(
                              'assets/animated_vectors/register_done_animation.json',
                              repeat: false),
                        );
                      });   
          });
    } on FirebaseAuthException catch (e) {
      Get.back();
      CustomToast.showRedToast(messsage: e.toString());
    }
  }
}
