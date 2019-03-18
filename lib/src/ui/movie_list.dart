import 'package:flutter/material.dart';

import 'package:flutter_bloc/src/blocs/movies_bloc.dart';
import 'package:flutter_bloc/src/models/item_model.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    moviesBloc.fetchAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: moviesBloc.allMovies,
        builder: (_, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
          fit: BoxFit.cover,
        );
      }
    );
  }
}
