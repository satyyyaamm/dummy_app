import 'package:dummy_application/model/children_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildrenController extends GetxController {
  // Controller where we have the business logic for the app
  // text controller, function etc
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  final status = true.obs;
  final children = [
    ChildrensModel(name: 'Satyam Tiwari', country: 'India', status: false),
    ChildrensModel(name: 'Paul Zimmermann', country: 'Germany', status: true),
    ChildrensModel(name: 'John Doe', country: 'America', status: true),
  ].obs;

  addChild() {
    children.add(ChildrensModel(
        name: nameController.text, country: countryController.text, status: status.value));

    Get.back();
  }
}
