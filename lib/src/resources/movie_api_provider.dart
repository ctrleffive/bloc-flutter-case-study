import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'package:flutter_bloc/src/models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'cedf4961c09efcd6af2dd17ae3801709';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final Response response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}