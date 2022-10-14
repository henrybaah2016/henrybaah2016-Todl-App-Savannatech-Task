import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:todr/constants.dart';
import 'package:todr/todo_model.dart';

class ApiService {
  Future<List<TodoModel>?> getLists() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.todosEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<TodoModel> _model = todoModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

Future<TodoModel> fetchTodos() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

  if (response.statusCode == 200) {
    return TodoModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load List');
  }
}