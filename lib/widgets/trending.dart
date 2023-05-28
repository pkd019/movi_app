import 'package:flutter/material.dart';
import 'package:movie_time/description.dart';
import 'package:movie_time/utils/font.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textFont( text: 'Trending movies', color:Colors.white,size:20 ,),
          Container(height: 10,),
          Container(height: 310,
            child: ListView.builder(itemCount: trending.length
                ,scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (Context)=>Description(name:trending[index]['title']!=null?  trending[index]['original_title']:'',
                              description: trending[index]['overview'],
                              bannarurl: 'http://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                              posterurl:'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path'] ,
                              ratting:trending[index]['vote_average'].toString(),
                              launchingDate: trending[index]['release_date'])));

                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(

                            height:200,
                            decoration:BoxDecoration(
                                image: DecorationImage(image:NetworkImage(
                                    'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                                ))),),
                          Container(child: textFont(text:
                          trending[index]['title']!=null? trending[index]['title']:'loading'
                            , color:Colors.white,size: 18,),),



                        ],
                      ),
                    ),

                  );
                }),)

        ],
      ),
    );
  }
}
