import 'package:flutter/material.dart';

import 'package:flutter_bloc/src/blocs/movies_bloc.dart';
import 'package:flutter_bloc/src/models/item_model.dart';
import 'package:flutter_bloc/src/views/movie_single.dart';

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
  void dispose() {
    moviesBloc.dispose();
    super.dispose();
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

  Future<void> _openSingleView({ItemModel item, int index}) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return MovieSingle(
          title: item.results[index].title,
          posterUrl: item.results[index].backdropPath,
          description: item.results[index].overview,
          releaseDate: item.results[index].releaseDate,
          voteAverage: item.results[index].voteAverage,
          movieId: item.results[index].id,
        );
      })
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> itemSnap) {
    return GridView.builder(
      itemCount: itemSnap.data.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return InkResponse(
          onTap: () => this._openSingleView(
            item: itemSnap.data,
            index: index
          ),
          enableFeedback: true,
          child: Image.network(
            'https://image.tmdb.org/t/p/w185${itemSnap.data.results[index].posterPath}',
            fit: BoxFit.cover,
          ),
        );
      }
    );
  }
}
