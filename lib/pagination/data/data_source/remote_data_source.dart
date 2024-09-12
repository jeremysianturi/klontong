import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ready_pagination/core/handle_error/execptions.dart';
import '../model/post.dart';

abstract class RemoteData {
  Future<List<Post>> getData(
      {required int pageNumber, required int numberOfPostsPerRequest});
  Future<void> addNewMenu(Map<String, dynamic> menuItem);
}

class RemoteDataImpl extends RemoteData {
  @override
  Future<List<Post>> getData(
      {required int pageNumber, required int numberOfPostsPerRequest}) async {
    final response = await http.get(Uri.parse(
        "http://127.0.0.1:5000/menus?page=$pageNumber&per_page=$numberOfPostsPerRequest"));
    debugPrint('value responseList : $pageNumber : $numberOfPostsPerRequest');
    try {
      Map<String, dynamic> responseBody = json.decode(response.body);
      List responseList = responseBody['data'];
      debugPrint('value responseList : $responseList');
      List<Post> postList =
          responseList.map((data) => Post.fromJson(data)).toList();
      return postList;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> addNewMenu(Map<String, dynamic> menuItem) async {
    debugPrint('body: ${jsonEncode(menuItem)}');
    final response = await http.post(
      Uri.parse("http://127.0.0.1:5000/menus"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(menuItem),
    );

    if (response.statusCode != 201) {
      throw ServerException(
          message: "Failed to add new menu ${response.statusCode}");
    }
  }
}
