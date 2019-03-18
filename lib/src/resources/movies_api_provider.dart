import 'dart:convert';

import 'package:flutter_bloc/src/constants/apis.dart';
import 'package:http/http.dart';

import 'package:flutter_bloc/src/models/item_model.dart';

class MoviesApiProvider {
  final Client client = Client();

  /// Fetch movie list from API.
  Future<ItemModel> fetchMovieList() async {
    final Response apiResponse = await this.client.get(ApiConstants.popular);
    if (apiResponse.statusCode != 200) throw Exception('Failed to fetch movies!');
    final Map<String, dynamic> jsonData = json.decode(apiResponse.body);
    final ItemModel item = ItemModel(jsonData);
    return item;
  }
}