import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_app/features/auth/presentation/cubit/states.dart';

import '../../data/models/patient_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  login() async {
    emit(AuthLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState('Wrong password provided for that user.'));
      } else {
        emit(AuthErrorState(e.code));
      }
    }
  }

  register() async {
    emit(AuthLoadingState());
    // register with firebase
    try {
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = credential.user;
      user?.updateDisplayName(nameController.text);

      var model = PatientModel(
        name: nameController.text,
        email: emailController.text,
        uid: user?.uid,
      );

      await FirebaseFirestore.instance
          .collection('patient')
          .doc(user?.uid)
          .set(model.toJson());

      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('The account already exists for that email.'));
      } else {
        emit(AuthErrorState('Something went wrong'));
      }
    } catch (e) {
      emit(AuthErrorState('Something went wrong'));
    }
  }
}
