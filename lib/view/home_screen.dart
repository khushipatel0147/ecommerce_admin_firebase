import 'dart:async';

import 'package:ecommerce_admin_firebase/controller/admin_controller.dart';
import 'package:ecommerce_admin_firebase/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  AdminController controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Ecommerce App Add Data',
          style: TextStyle(
              letterSpacing: 1,
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          FirebaseHelper.helper.addNotes(
              title: txtTitle.text,
              des: txtDescription.text,
              price: txtPrice.text,
              cate: controller.finalcategory.value,
              image: controller.finalImage.value);

          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              Timer(Duration(seconds: 5), () {
                txtTitle.clear();
                txtDescription.clear();
                txtPrice.clear();
                Get.back();
              });

              return AlertDialog(
                actions: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image.network(
                          '${controller.doneImage.value}',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Your Product Data Successfully Add',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 18,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.done,
          color: Colors.black,
          size: 25,
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: txtTitle,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtDescription,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Description',
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtPrice,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Price',
                      labelText: 'Price',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(5)),
                  child: Obx(
                    () => DropdownButton(
                      alignment: Alignment.center,
                      isExpanded: true,
                      style: const TextStyle(
                          color: Colors.white, letterSpacing: 1, fontSize: 17),
                      dropdownColor: Colors.amber,
                      items: controller.categoryList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Center(
                                    child: Text(
                                  "$e",
                                  style: const TextStyle(color: Colors.black),
                                )),
                              ))
                          .toList(),
                      focusColor: Colors.black,
                      hint: Text(
                        '${controller.finalcategory}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      value: controller.finalcategory.value,
                      onChanged: (value) {
                        controller.changeCategory(value as String);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ExpansionTile(
                    title: const Text(
                      'Select Image',
                      style: TextStyle(letterSpacing: 1, color: Colors.black),
                    ),
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 300,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: InkWell(
                                        onTap: () {
                                          controller.changeImage(index);
                                        },
                                        child: Image.network(
                                          '${controller.imageList[index]}',
                                          height: 50,
                                          width: 50,
                                        )));
                              },
                              itemCount: controller.imageList.length,
                            ),
                          ),
                        ],
                      )
                    ])
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
