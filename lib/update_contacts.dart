import 'package:flutter/material.dart';
import 'package:yt/model.dart';
import 'package:yt/repository.dart';

class UpdateContacts extends StatefulWidget {
  const UpdateContacts({Key? key});

  @override
  State<UpdateContacts> createState() => _UpdateContactsState();
}

class _UpdateContactsState extends State<UpdateContacts> {
  List<Blog> listBlog = [];
  Repository repository = Repository();
  bool isLoading = true;

  getData() async {
    listBlog = await repository.getData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UPDATE CONTACTS',
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
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        listBlog[index].name,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listBlog[index].number,
                            style: TextStyle(color: Colors.blue.shade900),
                          ),
                          Text(
                            listBlog[index].birthDate,
                            style: TextStyle(color: Colors.blue.shade900),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue.shade900),
                            onPressed: () {
                              Navigator.of(context).popAndPushNamed(
                                '/edit_contacts',
                                arguments: [
                                  listBlog[index].id,
                                  listBlog[index].name,
                                  listBlog[index].number,
                                  listBlog[index].birthDate
                                ],
                              );
                            },
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.delete, color: Colors.blue.shade900),
                            onPressed: () async {
                              bool response = await repository.DeleteData(
                                  int.parse(listBlog[index].id));
                              if (response) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    '/home_page', ModalRoute.withName('/'));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('FAILED DELETE DATA')));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
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

// class UpdateContacts extends StatefulWidget {
//   const UpdateContacts({Key? key});

//   @override
//   State<UpdateContacts> createState() => _UpdateContactsState();
// }

// class _UpdateContactsState extends State<UpdateContacts> {
//   List<Blog> listBlog = [];
//   Repository repository = Repository();
//   bool isLoading = true;

//   getData() async {
//     listBlog = await repository.getData();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'UPDATE CONTACTS',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.separated(
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 4,
//                   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   child: ListTile(
//                     title: Text(listBlog[index].name),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(listBlog[index].number),
//                         Text(listBlog[index].birthDate),
//                       ],
//                     ),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit),
//                           onPressed: () {
//                             Navigator.of(context).popAndPushNamed(
//                               '/edit_contacts',
//                               arguments: [
//                                 listBlog[index].id,
//                                 listBlog[index].name,
//                                 listBlog[index].number,
//                                 listBlog[index].birthDate
//                               ],
//                             );
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.delete),
//                           onPressed: () async {
//                             bool response = await repository.DeleteData(int.parse(listBlog[index].id));
//                             if(response){
//                               Navigator.pushNamedAndRemoveUntil(context, '/home_page',ModalRoute.withName('/'));
//                             }else{
//                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('FAILED DELETE DATA')));
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return const Divider();
//               },
//               itemCount: listBlog.length,
//             ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:yt/model.dart';
// import 'package:yt/repository.dart';

// class UpdateContacts extends StatefulWidget {
//   const UpdateContacts({Key? key});

//   @override
//   State<UpdateContacts> createState() => _UpdateContactsState();
// }

// class _UpdateContactsState extends State<UpdateContacts> {
//   List<Blog> listBlog = [];
//   Repository repository = Repository();
//   bool isLoading = true; 

//   getData() async {
//     listBlog = await repository.getData();
//     setState(() {
//       isLoading = false; 
//     });
//   }

//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'UPDATE CONTACTS',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.separated(
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () => Navigator.of(context).popAndPushNamed(
//                       '/edit_contacts',
//                       arguments: [
//                         listBlog[index].id,
//                         listBlog[index].name,
//                         listBlog[index].number,
//                         listBlog[index].birthDate
//                       ]),
//                   child: Card(
//                     elevation: 4,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     child: ListTile(
//                       title: Text(listBlog[index].name),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(listBlog[index].number),
//                           Text(listBlog[index].birthDate),
//                         ],
//                       ),
//                       trailing: Icon(Icons.edit),
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return Divider();
//               },
//               itemCount: listBlog.length,
//             ),
//     );
//   }
// }
