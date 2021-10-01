import 'package:flutter/material.dart';


class NewsDetails extends StatelessWidget {
  const NewsDetails({Key key, this.param}) : super(key: key);

  final param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CryptoTrack'),
        ),
        body: ListView(children: [
          if(param.urlToImage!=null)
          Container(child: Image.network(param.urlToImage)),
          Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Container(child:Text(param.title,style: TextStyle(fontSize: 17),),padding: EdgeInsets.all(10),),
          if(param.author!=null)
          Container(child: ActionChip(label:Text('Author: ${param.author}'),onPressed: (){print('Hello');},),)],),margin: EdgeInsets.all(10),),

          Divider(height: 2,thickness: 3,),
          if(param.description!=null)
          Container(child:Text('Description',style: TextStyle(fontSize: 20,color:Colors.greenAccent),),padding: EdgeInsets.all(10)),
          Container(child:Text(param.description,style: TextStyle(fontSize: 16)),padding: EdgeInsets.all(10),),
          
        ]));
  }
}
