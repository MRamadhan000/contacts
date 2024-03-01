import 'package:flutter/material.dart';
import 'package:yt/add_contacts.dart';
import 'package:yt/display_contacts.dart';
import 'package:yt/edit_contacts.dart';
import 'package:yt/update_contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/home_page': (context) => const MyHomePage(),
        '/display_contacts': (context) => const DisplayContacts(),
        '/add_contacts': (context) => const AddContact(),
        '/update_contacts': (context) => const UpdateContacts(),
        '/edit_contacts': (context) => const EditContacts(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'CONTACTS',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.blue.shade900],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.contacts,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/display_contacts');
                },
                child: const Text('DISPLAY CONTACTS'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_contacts');
                },
                child: const Text('ADD CONTACTS'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/update_contacts');
                },
                child: const Text('UPDATE CONTACTS'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:yt/add_contacts.dart';
// import 'package:yt/display_contacts.dart';
// import 'package:yt/edit_contacts.dart';
// import 'package:yt/update_contacts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/home_page' :(context) => const MyHomePage(),
//         '/display_contacts': (context) => const DisplayContacts(),
//         '/add_contacts': (context) => const AddContact(),
//         '/update_contacts': (context) => const UpdateContacts(),
//         '/edit_contacts': (context) => const EditContacts(),
//       },
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'CONTACTS',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(children: [
//           const SizedBox(height: 30),
//           TextButton(
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.blue,
//             ),
//             onPressed: () {
//               Navigator.of(context).pushNamed('/display_contacts');
//             },
//             child: const Text('DISPLAY CONTACTS'),
//           ),
//           const SizedBox(height: 20),
//           TextButton(
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.blue,
//             ),
//             onPressed: () {
//               Navigator.of(context).pushNamed('/add_contacts');
//             },
//             child: const Text('ADD CONTACTS'),
//           ),
//           const SizedBox(height: 20),
//           TextButton(
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.blue,
//             ),
//             onPressed: () {
//               Navigator.of(context).popAndPushNamed('/update_contacts');
//             },
//             child: const Text('UPDATE CONTACTS'),
//           )
//         ]),
//       ),
//     );
//   }
// }
