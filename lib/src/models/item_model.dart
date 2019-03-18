class ItemModel {
  int           _page;
  List<_Result> _results;
  int           _totalResults;
  int           _totalPages;
  
  ItemModel(Map<String, dynamic> jsonData) {
    this._page         = jsonData['page'];
    this._results      = (jsonData['results'] as List<Map<String, dynamic>>)
                          .map((Map<String, dynamic> result) => _Result(result))
                          .toList();
    this._totalPages   = jsonData['total_pages'];
    this._totalResults = jsonData['total_results'];
  }

  int           get page         => this._page;
  List<_Result> get results      => this._results;
  int           get totalPages   => this._totalPages;
  int           get totalResults => this._totalResults;
}
  
class _Result {
  int       _id;
  bool      _video;
  bool      _adult;
  String    _title;
  List<int> _genreIds;
  String    _overview;
  int       _voteCount;
  double    _popularity;
  String    _posterPath;
  String    _releaseDate;
  double    _voteAverage;
  String    _backdropPath;
  String    _originalTitle;
  String    _originalLanguage;

  _Result(Map<String, dynamic> jsonData) {
    this._id               = jsonData['id'];
    this._video            = jsonData['video'];
    this._title            = jsonData['title'];
    this._adult            = jsonData['adult'];
    this._genreIds         = (jsonData['genre_ids'] as List<int>)
                              .map((int item) => item)
                              .toList();
    this._overview         = jsonData['overview'];
    this._voteCount        = jsonData['vote_count'];
    this._popularity       = jsonData['popularity'];
    this._posterPath       = jsonData['poster_path'];
    this._voteAverage      = jsonData['vote_average'];
    this._releaseDate      = jsonData['release_date'];
    this._backdropPath     = jsonData['backdrop_path'];
    this._originalTitle    = jsonData['original_title'];
    this._originalLanguage = jsonData['original_language'];
  }

  int       get id               => this._id;
  bool      get video            => this._video;
  String    get title            => this._title;
  bool      get adult            => this._adult;
  List<int> get genreIds         => this._genreIds;
  String    get overview         => this._overview;
  int       get voteCount        => this._voteCount;
  double    get popularity       => this._popularity;
  String    get posterPath       => this._posterPath;
  double    get voteAverage      => this._voteAverage;
  String    get releaseDate      => this._releaseDate;
  String    get backdropPath     => this._backdropPath;
  String    get originalTitle    => this._originalTitle;
  String    get originalLanguage => this._originalLanguage;
}