import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yt/model.dart';

class Repository {
  final _baseUrl = 'https://65c828b4a4fbc162e1119c31.mockapi.io';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String name, String number, String birthDate) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/users'),
        body: {
          'name': name,
          'number': number,
          'birthDate': birthDate,
        },
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future putData(int id,String name, String number, String birthDate) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/users/$id'),
        body: {
          'name': name,
          'number': number,
          'birthDate': birthDate,
        },
      );
        if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future DeleteData(int id) async{
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/users/$id'),);
      if (response.statusCode == 200) {
        return true;
      }
      else{
        return false;
      }
      
    } catch (e) {
      print(e.toString());
    }
  }
}
