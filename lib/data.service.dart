

import 'dart:convert';
import 'Movie.dart';
import 'FullMovie.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;

abstract class DataService {
  List<Movie> getTopRatedMovies ();
  List<Movie> getNowPlayingMovies ();
  List<Movie> getPopularMovies ();
  List<Movie> getUpcomingMovies ();
  FullMovie getMovie( num id);
}

class TMDBService implements DataService {
  String api_key = "?api_key=1e4807a94b272e6c632501fa2cb08244";
  String url = "https://api.themoviedb.org/3/movie";

  List<Movie> getTopRatedMovies () {
    var path = url + "/top_rated" + api_key;
    var client = new BrowserClient();
    client.get(path).then((response) {
      print("Response body: ${response.body}");
    });
  }

  /*
*   Get the list of movies playing that have been,
*   or are being released this week.
*   This list refreshes every day.
*/
  Future<List<Movie>> getNowPlayingMovies () async {
    var path = url + "/now_playing" + api_key;
    var client = new BrowserClient();
    var response = await client.get(path);
    var decoded = JSON.decode(response.body);
    List myList = decoded["results"];

    return myList.map((obj) => new Movie(obj)).toList();

  }

  /*
*   Get the list of popular movies on The Movie Database.
*   This list refreshes every day.
*/
  List<Movie> getPopularMovies () {
    var path = url + "/popular" + api_key;
    var client = new BrowserClient();
    client.get(path).then((response) {
      print("Response body: ${response.body}");
    });
  }

  /*
*   Get the list of upcoming movies by release date.
*   This list refreshes every day.
*/
  List<Movie> getUpcomingMovies () {
    var path = url + "/upcoming" + api_key;
    var client = new BrowserClient();
    client.get(path).then((response) {
      response.body;
    });
  }

  @override
  FullMovie getMovie(num id) {

  }

}
