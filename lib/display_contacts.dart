import 'package:flutter/material.dart';
import 'package:yt/model.dart';
import 'package:yt/repository.dart';

class DisplayContacts extends StatefulWidget {
  const DisplayContacts({Key? key});

  @override
  State<DisplayContacts> createState() => _DisplayContactsState();
}

class _DisplayContactsState extends State<DisplayContacts> {
  List<Blog> listBlog = [];
  bool isLoading = true;
  Repository repository = Repository();

  getData() async {
    listBlog = await repository.getData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CONTACTS',
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
        child: isLoading
            ? const Center(
                child: const CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.account_circle, size: 40, color: Colors.blue),
                              const SizedBox(width: 10),
                              Text(
                                listBlog[index].name,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Number: ${listBlog[index].number}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Birthdate: ${listBlog[index].birthDate}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: listBlog.length,
              ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:yt/model.dart';
// import 'package:yt/repository.dart';

// class DisplayContacts extends StatefulWidget {
//   const DisplayContacts({Key? key});

//   @override
//   State<DisplayContacts> createState() => _DisplayContactsState();
// }

// class _DisplayContactsState extends State<DisplayContacts> {
//   List<Blog> listBlog = [];
//   bool isLoading = true;
//   Repository repository = Repository();

//   getData() async {
//     listBlog = await repository.getData();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'CONTACTS',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: EdgeInsets.all(8.0),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           listBlog[index].name,
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(listBlog[index].number),
//                         Text(listBlog[index].birthDate),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               itemCount: listBlog.length,
//             ),
//     );
//   }
// }
