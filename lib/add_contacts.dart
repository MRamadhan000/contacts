import 'package:flutter/material.dart';
import 'package:yt/repository.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  Repository repository = Repository();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD CONTACTS',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.blue.shade900],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.person_add,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
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
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Number",
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
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Birthdate",
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
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    bool response = await repository.postData(
                        _controller1.text, _controller2.text, _controller3.text);
                    if (response) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('FAILED SENT DATA')),
                      );
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:yt/repository.dart';

// class AddContact extends StatefulWidget {
//   const AddContact({Key? key}) : super(key: key);

//   @override
//   State<AddContact> createState() => _AddContactState();
// }

// class _AddContactState extends State<AddContact> {
//   Repository repository = Repository();
//   final TextEditingController _controller1 = TextEditingController();
//   final TextEditingController _controller2 = TextEditingController();
//   final TextEditingController _controller3 = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
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
//           bool response = await repository.postData(
//               _controller1.text, _controller2.text, _controller3.text);
//           if (response) {
//             Navigator.pop(context);
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('FAILED SENT DATA')),
//             );
//           }
//         },
//         label: const Text('Submit'),
//         icon: const Icon(Icons.check),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }
