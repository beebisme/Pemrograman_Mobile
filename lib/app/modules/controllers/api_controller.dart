import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

//Single data
class ApiController extends GetxController {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  var todo = <Todo>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/todos/5'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        todo.assignAll([Todo.fromJson(data)]);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

//All data
// class ApiController extends GetxController {
//   final String baseUrl = "https://jsonplaceholder.typicode.com";

//   var todo = <Todo>[].obs;

//   @override
//   void onInit() {
//     fetchData();
//     super.onInit();
//   }

//   void fetchData() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/todos'));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         todo.assignAll(data.map((e) => Todo.fromJson(e)).toList());
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
// }
