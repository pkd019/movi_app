import 'package:flutter/material.dart';
import 'package:movie_time/utils/font.dart';
import 'package:movie_time/widgets/top_rated.dart';
import 'package:movie_time/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark().copyWith(primary: Colors.green),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedmovies = [];
  List tv = [];
  List populartv = [];

  final String apikey = '0dd65703503f5774254ac95724a1d264';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZGQ2NTcwMzUwM2Y1Nzc0MjU0'
      'YWM5NTcyNGExZDI2NCIsInN1YiI6IjY0NDIzNW'
      'M3ZTJiY2E4MDUwOTQzM2NkZiIsInNjb3BlcyI6'
      'WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.o'
      'KDQyUkn5CsrNzRmDlP3aza0PUziubl1uMuFnvlNlcA';

  loadmovies()async{
    TMDB tmdbWithCustomlogs = TMDB(ApiKeys(apikey,readaccesstoken),
        logConfig : ConfigLogger(
            showErrorLogs: true ,
            showLogs: true
        ));
    Map trendingresult = await tmdbWithCustomlogs.v3.trending.getTrending();
    Map toprated = await tmdbWithCustomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomlogs.v3.tv.getTopRated();
    Map populartvshow = await tmdbWithCustomlogs.v3.tv.getPopular();
    print(trendingresult);
    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = toprated['results'];
      tv =  tvresult['results'];
      populartv =populartvshow['results'];
    });
    print(trendingMovies);
  }
  @override
  void initState() {
    super.initState();
    loadmovies();
    // Add code after super
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textFont(text: 'home', color:Colors.white,size: 40,),

      ),
      body: ListView(
       children: [ TrendingMovies( trending:trendingMovies ,),
         TopRated(toprated: topratedmovies)

       
       ],
      ),
    );
  }
}
