import 'package:flutter/material.dart';
import 'package:movie_time/utils/font.dart';

class Description extends StatelessWidget {
  final String name , description , bannarurl , posterurl ,ratting , launchingDate;

  const Description({super.key, required this.name, required this.description, required this.bannarurl, required this.posterurl, required this.ratting, required this.launchingDate});

  get color => Colors.white;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [Positioned(child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(bannarurl,fit: BoxFit.cover,),
                ))
                ,Positioned(bottom: 10,
                      child: textFont(text: 'Average ratting - $ratting', color: color, size: 20))
                ],

              ),
            ),
            SizedBox(height: 15,),
            Container(padding: EdgeInsets.all(10),
            child: textFont(text: name!=null?name:'not loaded', size: 20,color:color ,),),
            Container(padding: EdgeInsets.only(left: 10),
                child:  textFont(text:'releasing on - '+launchingDate
                  , color:Colors.white,size: 18,),),
            Row(
              children: [
                Container(margin:EdgeInsets.all(5)
                  ,height: 200,width: 100,
                child: Image.network(posterurl),),
                Flexible(child:  Container(padding: EdgeInsets.only(left: 10),
                  child:  textFont(text:'Description - '+description
                    , color:Colors.white,size: 18,),))

              ],
            )


          ],
        ),
      ),

    );
  }
}
