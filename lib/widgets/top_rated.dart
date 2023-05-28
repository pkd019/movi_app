import 'package:flutter/material.dart';
import 'package:movie_time/utils/font.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textFont( text: 'Toprated movies', color:Colors.white,size:20 ,),
          Container(height: 10,),
          Container(height: 310,
            child: ListView.builder(itemCount: toprated.length
                ,scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (Context)=>Description(name:  toprated[index]['original_title'],
                              description: toprated[index]['overview'],
                              bannarurl: 'http://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                              posterurl:'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'] ,
                              ratting:toprated[index]['vote_average'].toString(),
                              launchingDate: toprated[index]['release_date'])));

                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(

                            height:200,
                            decoration:BoxDecoration(
                                image: DecorationImage(image:NetworkImage(
                                    'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                ))),),
                          Container(child: textFont(text:
                          toprated[index]['title']!=null? toprated[index]['title']:'loading'
                            , color:Colors.white,size: 18,),)

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
