// import 'package:flutter/material.dart';

// class TodoDialog extends StatelessWidget {
//   final bool isEdit;
//   final TextEditingController controller;
//   final VoidCallback onSubmit;

//   const TodoDialog(
//       {super.key,
//       this.isEdit = false,
//       required this.controller,
//       required this.onSubmit});
//         @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text("${isEdit ? "Edit" : "Add"} Todo"),
//       content: TextField(
//         controller: controller,
//         decoration: const InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: "Enter the task",
//           contentPadding: EdgeInsets.symmetric(horizontal: 16),
//         ),
//       ),
//       actions: [
//         ElevatedButton(
//           onPressed: onSubmit,
//           child: Text(isEdit ? "Edit" : "Add"),
//         ),
//       ],
//     );
//   }
// }
