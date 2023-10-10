import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final String title;
  final String buttonName;
  final TextEditingController teController;
  final Key formKey;
  final VoidCallback onButtonTap;

  const MyBottomSheet(
      {super.key,
      required this.formKey,
      required this.title,
      required this.buttonName,
      required this.teController,
      required this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            TextFormField(
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "enter text";
                  }
                  return null;
                },
                minLines: 1,
                maxLines: 3,
                controller: teController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(height: 10),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onButtonTap, child: Text(buttonName)))
          ],
        ),
      ),
    );
  }
}
