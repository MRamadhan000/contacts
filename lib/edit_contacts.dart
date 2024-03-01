import 'package:flutter/material.dart';
import 'package:yt/repository.dart';

class EditContacts extends StatefulWidget {
  const EditContacts({super.key});

  @override
  State<EditContacts> createState() => _EditContactsState();
}

class _EditContactsState extends State<EditContacts> {
  Repository repository = Repository();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    _controller1.text = args[1];
    _controller2.text = args[2];
    _controller3.text = args[3];
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'EDIT CONTACTS',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "NAME",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: _controller1,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "NUMBER",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: _controller2,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "BIRTHDATE",
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: _controller3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          bool response = await repository.putData(int.parse(args[0]),
              _controller1.text, _controller2.text, _controller3.text);
          if (response) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home_page',
              ModalRoute.withName('/'),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: const Text("FAILED SEND DATA")));
          }
        },
        label: const Text('UPDATE'),
        icon: const Icon(Icons.check),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:yt/repository.dart';

// class EditContacts extends StatefulWidget {
//   const EditContacts({super.key});

//   @override
//   State<EditContacts> createState() => _EditContactsState();
// }

// class _EditContactsState extends State<EditContacts> {
//   Repository repository = Repository();
//   final TextEditingController _controller1 = TextEditingController();
//   final TextEditingController _controller2 = TextEditingController();
//   final TextEditingController _controller3 = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments as List<String>;
//     _controller1.text = args[1];
//     _controller2.text = args[2];
//     _controller3.text = args[3];
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'ADD CONTACTS',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         backgroundColor: Colors.blue,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "NAME",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               controller: _controller1,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "NUMBER",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               controller: _controller2,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "BIRTHDATE",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               controller: _controller3,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () async {
//           bool response = await repository.putData(int.parse(args[0]),
//               _controller1.text, _controller2.text, _controller3.text);
//           if (response) {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               '/home_page',
//               ModalRoute.withName('/'),
//             );
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: const Text("FAILED SEND DATA")));
//           }
//         },
//         label: const Text('UPDATE'),
//         icon: const Icon(Icons.check),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }
