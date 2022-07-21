// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
//
// class CommentPage extends StatefulWidget {
//
//   late dynamic Product_ID;
//   late String Token;
//
//   //const CommentPage({Key? key}) : super(key: key);
//   CommentPage({required this.Product_ID,required this.Token});
//
//   @override
//   State<CommentPage> createState() => _CommentPageState(Hotel_ID:this.Product_ID,Token: this.Token);
// }
//
// class _CommentPageState extends State<CommentPage> {
//
//   List<comment> comments=[];
//   late dynamic Hotel_ID;
//   late String Token;
//   TextEditingController commentcontroler = TextEditingController();
//
//   _CommentPageState({required this.Hotel_ID, required this.Token});
//
//   FetchAllComments() async
//   {
//     final category = await DioClient.GetAllComments(this.Hotel_ID,this.Token);
//
//     this.comments = category.map((element) => comment.fromJson(element) ).toList();
//     print("Comments Are "+"${this.comments}");
//   }
//
//
//   Widget _buildCommentList()
//   {
//     return  FutureBuilder(
//         future: FetchAllComments(),
//         builder: (context, snapshot)
//         {
//           if (this.comments.isNotEmpty)
//           {
//             return
//               Padding(
//                 padding: const EdgeInsetsDirectional.only(start: 10,top: 10 ,end: 5),
//                 child:
//                 ListView.separated(itemBuilder: (context,index)=>_buildCommentItem(comments[index]), separatorBuilder: (contetx,index)=>SizedBox(height: 20,), itemCount: this.comments.length ),
//
//               );
//           }
//
//           return Center(child: Text("No Comments Found ,be the first to comment",) , );
//
//         }
//     );
//   }
//
//   Widget _buildCommentItem(comment Comment){
//     return Container(height: 80 ,decoration: BoxDecoration(
//         color: Colors.orange,
//         borderRadius: BorderRadius.circular(35),
//         border: Border.all(color: Colors.orange, width: 2))
//       ,child: Row(children: [Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: CircleAvatar(backgroundImage: NetworkImage(Comment.ImageURL), radius: 25,),
//       ),SizedBox(width:10),Padding(
//         padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//         child: Column( crossAxisAlignment:CrossAxisAlignment.start,children: [Text("${Comment.Username}", style: TextStyle(color:Colors.purple,fontSize: 16,fontWeight: FontWeight.w600),),
//           SizedBox(height: 5,),Text("${Comment.message}", style: TextStyle(color: Colors.orange),)],
//         ),
//       )],),);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title:Text("Comments",),
//         ),
//         body: Container(
//           color:Colors.grey,
//           child:   Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children:[
//                 Expanded(child: _buildCommentList()),
//                 Container( child:
//                 Row(children:[
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//
//                           controller:commentcontroler ,
//                           minLines: 1,
//                           maxLines: 5,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(borderRadius:BorderRadius.circular(40)),
//                             hintText: "write a comment ...",hintStyle: TextStyle(fontSize:19,color:Colors.grey ),
//
//                           )
//                       ),
//                     ),
//                   ) ,    Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: CircleAvatar(
//                       radius: 24,
//                       backgroundColor: Colors.grey,
//                       child: IconButton(icon:Icon(Icons.send_outlined,color: Colors.grey,size: 20,),
//                         onPressed: (){
//                           DioClient.AddComment(commentcontroler.text, this.Token, this.Hotel_ID);
//                           setState((){
//                             commentcontroler.text='';
//
//                           });
//                         },),
//                     ),
//                   ),  ]) )]
//           ),
//         )
//     );
//   }
//
//
//
//
// }
//
// class comment{
//   late String message;
//   late String Username;
//   late String ImageURL;
//
//   comment.fromJson(Map<String,dynamic>JASON)
//   {
//     this.message = JASON['message'];
//     this.Username= JASON['user']['name'];
//     this.ImageURL = JASON['user']['image_url'];
//
//   }
//
//
// }
//
