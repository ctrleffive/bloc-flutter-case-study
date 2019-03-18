import 'dart:convert';

import 'package:flutter_bloc/src/constants/apis.dart';
import 'package:http/http.dart';

import 'package:flutter_bloc/src/models/item_model.dart';

class MoviesApiProvider {
  final Client _client = Client();

  /// Fetch movie list from API.
  Future<ItemModel> fetchMovieList() async {
    try {
      final Response apiResponse = await this._client.get(ApiConstants.popular);
      if (apiResponse.statusCode != 200) throw Exception('Incorrect request!');
      final Map<String, dynamic> jsonData = json.decode(apiResponse.body);
      final ItemModel item = ItemModel(jsonData);
      return item;
    } catch (e) {
      final String message = '${e.runtimeType}' == '_Exception' ? e.message : 'Failed to fetch movies!';
      throw Exception(message);
    }
  }
}