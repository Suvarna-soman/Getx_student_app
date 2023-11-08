import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_getx_app/constants/const_widgets/size.dart';
import 'package:my_first_getx_app/constants/const_widgets/text.dart';
import 'package:my_first_getx_app/controls/data_controller.dart';
import 'package:my_first_getx_app/model/user.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({super.key});

  get index => null;

  @override
  Widget build(BuildContext context) {
    final dataController = Get.put(DataController());

    TextEditingController fnc = TextEditingController();
    TextEditingController lnc = TextEditingController();
    TextEditingController agc = TextEditingController();
    TextEditingController phc = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  tNewSubTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                    controller: fnc,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "first name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      final RegExp lettersOnly = RegExp(r'^[A-Za-z]+$');

                      if (!lettersOnly.hasMatch(value)) {
                        return 'Name should only contain letters';
                      }

                      // Check for whitespace
                      if (value.contains(RegExp(r'\s'))) {
                        return 'Name should not contain spaces';
                      }
                      return null;
                    }),
                const SizedBox(height: 10.0),
                TextFormField(
                    controller: lnc,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "last name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      final RegExp lettersOnly = RegExp(r'^[A-Za-z]+$');

                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }

                      if (!lettersOnly.hasMatch(value)) {
                        return 'Name should only contain letters';
                      }

                      // Check for whitespace
                      if (value.contains(RegExp(r'\s'))) {
                        return 'Name should not contain spaces';
                      }
                      return null;
                    }),
                const SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: agc,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add),
                    hintText: "age",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    int? age = int.tryParse(value);
                    if (age! < 18) {
                      return 'You must be at least 18 years old';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phc,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.call),
                    hintText: "phone number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length != 10  || !value.contains(RegExp(r'^[0-9]*$'))) {
                      return 'phone number must have 10 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? isValidate = formKey.currentState?.validate();
                      if (isValidate == true) {
                        final firstName = fnc.text;
                        final lastName = lnc.text;
                        final age = int.tryParse(agc.text);
                        final phoneNumber = int.tryParse(phc.text);
                        if (index != null) {
                          dataController.updateUser(
                              index: index,
                              user: User(
                                  firstName: firstName,
                                  lastName: lastName,
                                  age: age ?? 0,
                                  phoneNumber: phoneNumber ?? 0));
                        } else {
                          dataController.createUser(
                              user: User(
                                  firstName: firstName,
                                  lastName: lastName,
                                  age: age ?? 0,
                                  phoneNumber: phoneNumber ?? 0));
                        }
                        Get.toNamed('/detail');
                        Get.snackbar(
                            "message", "Account is created successfully");
                      }
                    },
                    child: Text(
                      tSubmit.toUpperCase(),
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
