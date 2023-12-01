import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dummy_application/controller/children_controller.dart';

class EditBottomSheet extends StatelessWidget {
  const EditBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.find<ChildrenController>();
    return Container(
      height: 420,
      width: double.infinity,
      color: Colors.white,
      // Form to validate the user to make sure they don't put
      // empty entry
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please make sure your enter the name!';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
                controller: controller.nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please make sure your enter the country!';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Home Country",
                ),
                controller: controller.countryController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                nicebuttons('Nice! 😃', () {
                  controller.status.value = true;
                }),
                naughtybutton('Naughty! 😈', () {
                  controller.status.value = false;
                }),
              ],
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.addChild();
                }
              },
              style: TextButton.styleFrom(
                minimumSize: const Size(200, 50),
                foregroundColor: Colors.black,
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // buttons seperated out for better code understanding
  GestureDetector nicebuttons(String text, void Function()? onTap) {
    final controller = Get.find<ChildrenController>();
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          width: 150,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  color: controller.status.value ? Colors.green : Colors.black,
                  width: controller.status.value ? 2 : 1),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }

// buttons seperated out for better code understanding
  GestureDetector naughtybutton(String text, void Function()? onTap) {
    final controller = Get.find<ChildrenController>();
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          width: 150,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  color: controller.status.value ? Colors.black : Colors.green,
                  width: controller.status.value ? 1 : 2),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
