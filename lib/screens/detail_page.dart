import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_getx_app/constants/const_widgets/size.dart';
import 'package:my_first_getx_app/controls/data_controller.dart';

import '../model/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("student Details"),
        centerTitle: true,
      ),
      body: GetBuilder<DataController>(
        builder: (dataController) => ListView.builder(
          itemCount: dataController.userCount,
          itemBuilder: (BuildContext context, int index) {
            final user = dataController.observableBox.getAt(index) as User;

            return ListTile(
              leading: IconButton(
                onPressed: () {
                  dataController.deleteUser(index);
                },
                icon: const Icon(Icons.remove),
              ),
              title: Text(user.firstName),
              subtitle: Column(
                children: [
                  Text("Last Name: ${user.lastName}"),
                  Text("Age: ${user.age}"),
                  Text("Phone Number: ${user.phoneNumber}"),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  _editUser(context, user, index);
                },
                icon: const Icon(Icons.edit),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/new');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editUser(BuildContext context, User user, int index) async {
    TextEditingController firstNameController =
        TextEditingController(text: user.firstName);
    TextEditingController lastNameController =
        TextEditingController(text: user.lastName);
    TextEditingController ageController =
        TextEditingController(text: user.age.toString());
    TextEditingController phoneNumberController =
        TextEditingController(text: user.phoneNumber.toString());

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(tDefaultSize),
          child: AlertDialog(
            title: const Text("Edit User"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(labelText: "First Name")),
                TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(labelText: "Last Name")),
                TextField(
                    controller: ageController,
                    decoration: const InputDecoration(labelText: "Age")),
                TextField(
                    controller: phoneNumberController,
                    decoration:
                        const InputDecoration(labelText: "Phone Number")),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  User editedUser = User(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    age: int.tryParse(ageController.text) ?? 0,
                    phoneNumber: int.tryParse(phoneNumberController.text) ?? 0,
                  );

                  dataController.updateUser(index: index, user: editedUser);
                  Get.snackbar(
                      "User Edited", "User information has been updated");

                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: const Text("Save"),
              ),
            ],
          ),
        );
      },
    );
  }
}
