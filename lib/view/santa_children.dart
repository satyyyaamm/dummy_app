import 'package:dummy_application/components/custom_list_tile.dart';
import 'package:dummy_application/components/edit_bottom_sheet.dart';
import 'package:dummy_application/controller/children_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SantasList extends StatefulWidget {
  const SantasList({super.key});

  @override
  State<SantasList> createState() => _SantasListState();
}

class _SantasListState extends State<SantasList> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChildrenController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child:
            // Obx to listen to the changes on the list happening
            Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Santa's Children list",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                // Controller children is the list where we get our data from
                itemCount: controller.children.length,
                itemBuilder: (BuildContext context, int index) {
                  // Custom list tile for repeatative lise tiles with list view builder
                  return CustomListTile(
                      onTap: () {
                        //  on tap event where we change the
                        //status of the children from naughty to nice and vice versa
                        controller.children[index].status = !controller.children[index].status;
                        setState(() {});
                      },
                      // passing the data to the widget
                      name: controller.children[index].name,
                      country: controller.children[index].country,
                      status: controller.children[index].status);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(const EditBottomSheet());
        },
        child: const Icon(Icons.add, size: 50),
      ),
    );
  }
}
