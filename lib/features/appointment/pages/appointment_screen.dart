import 'package:flutter/material.dart';

import 'appointment_list.dart';


class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Appointments') , centerTitle: true,),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: MyAppointmentList(),
      ),
    );
  }
}