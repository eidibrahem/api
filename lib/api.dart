import 'dart:convert';

import 'package:api/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class Api extends StatefulWidget {

  const Api ({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}
class _ApiState extends State<Api> {
 Future <List<Post>> getDataItem() async  {
   String url ="https://jsonplaceholder.typicode.com/albums";
   var jsonData = await http.get(Uri.parse(url)) ;
   if(jsonData.statusCode==200) {
     List jData = jsonDecode(jsonData.body);
     List<Post> items =[];

     for(var u in jData){
          Post post=Post.formj(u);
          items.add(post);
            }
         return items ;

   }else{
     throw Exception('error');
   }

}

 late Future<List<Post>> usrs ;

 void initState() {
   usrs=getDataItem();
   // TODO: implement initState

   super.initState();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Api',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),

           body:FutureBuilder<List<Post>>(
             future:usrs ,
           builder:(context,snapShot) {
             if(snapShot.hasData){
               return ListView.builder(
                 itemCount:snapShot.data!.length ,
                 itemBuilder:(context,index) {
                   return Container(
                     width: double.infinity,
                     child:Card(
                       elevation: 5,
                       child: (
                           Text("userid:${snapShot.data![index].userId} \n"
                               "id:${snapShot.data![index].id} \n title : ${snapShot.data![index].title} \n " )
                       ),
                     ),
                   );
                 },
               );
             }return Center(child: CircularProgressIndicator());
           },

           )



    );

  }}