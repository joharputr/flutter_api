import 'dart:convert';

import 'package:http/http.dart' as http;

class PostModel {
  String id, name, job, updatedAt;

  PostModel({this.id, this.name, this.job,this.updatedAt});

  factory PostModel.cratepostresult(Map<String, dynamic> object) {
    return PostModel(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        updatedAt: object['updateAt']);
  }

  static Future<PostModel> connectToApi(String name, String job) async {
    String apiUrl = "https://reqres.in/api/users";
    var apiRsult = await http.post(apiUrl, body: {"name": name, "job": job});
    var jsonData = json.decode(apiRsult.body);
    return PostModel.cratepostresult(jsonData);
  }

  static Future<PostModel> editData(String id, String name, String job) async {
    String apiUrl = "https://reqres.in/api/users/" + id;
    var apiRsult = await http.put(apiUrl, body: {"name": name, "job": job});
    var jsonData = json.decode(apiRsult.body);
    return PostModel.cratepostresult(jsonData);
  }
}
