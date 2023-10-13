import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController detailsController;
  final Key formKey;
  final VoidCallback onButtonTap;

  const MyBottomSheet(
      {super.key,
      required this.formKey,
      required this.titleController,
      required this.detailsController,
      required this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            MyTextField(hintText: "enter title", controller: titleController),
            const SizedBox(height: 10),
            MyTextField(
                hintText: "enter description", controller: detailsController),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: onButtonTap, child: const Text("Edit Done"))
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MyTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
          controller: controller,
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return "enter valid text";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: hintText, border: const OutlineInputBorder())),
    );
  }
}
