// import 'package:bubble/bubble.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
// import 'package:untitled1newone/Forums/Data%20Layer/Comment_Model.dart';
import 'package:untitled1newone/bottomnavigationbar/question.dart';
import 'package:untitled1newone/Forums/Forums.dart';
// import 'package:untitled1newone/color.dart';
import 'package:untitled1newone/expanded/expandedfour.dart';
import 'package:untitled1newone/forums/businesslogic/Forums_Cubit.dart';
import 'package:untitled1newone/forums/businesslogic/Forums_States.dart';
import 'package:untitled1newone/forums/datalayer/Comment_Model.dart';
import 'package:untitled1newone/theme/colors/color.dart';



// import 'Business Logic/Forums_Cubit.dart';
// import 'Business Logic/Forums_States.dart';


class QuestionReplies extends StatefulWidget {
  final Comment comment;
  const QuestionReplies({Key? key, required this.comment}) : super(key: key);

  @override
  State<QuestionReplies> createState() => _QuestionRepliesState(this.comment);
}

class _QuestionRepliesState extends State<QuestionReplies> {
  bool isloved=false;


  @override
  void initState() {
    BlocProvider.of<ForumsCubit>(context).GetAllCharacters() as List<Comment>;
  }
  final Comment comment;
  List<Comment>replies =[];
  TextEditingController commentcontroler = TextEditingController();

  _QuestionRepliesState(this.comment);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     //backgroundColor:Color.fromARGB(255, 235, 229, 229),
     backgroundColor: LightColors.a,
  

        appBar: AppBar(iconTheme: IconThemeData(color: LightColors.bb),
          backgroundColor: LightColors.white,
          elevation: 0,

            ),
      body:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QuestionItem(comment),
          Expanded(
            child: BlocBuilder<ForumsCubit,ForumsStates>(builder: (context,state)
            {
              if (state is CommentsLoaded)
              {
                replies = state.Comments.reversed.toList();//must change that
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          Reply(replies[index])
                      ,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10,),
                      itemCount: replies.length),
                );
              }
              else
                return Center(child: CircularProgressIndicator(color: LightColors.bb,));
            }
            ),
          ),
          Container( color: Colors.transparent,child:
      Row(children:[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(

                controller:commentcontroler ,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(40)),
                  hintText: "add a reply ...",hintStyle: TextStyle(fontSize:19,color: LightColors.bb ),

                )
            ),
          ),
        ) ,    Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: LightColors.bb,
            child: IconButton(icon:Icon(Icons.send_outlined,color:LightColors.white,size: 20,),
              onPressed: (){
                BlocProvider.of<ForumsCubit>(context).SendQuestion(commentcontroler.text);
                commentcontroler.clear();
              },),
          ),
        ),
        ],
      ),
      )
            ])
           );
          }

  Widget Reply (Comment comment){
    if(comment.Username==this.comment.Username)
      return Row(
        children: [
          Expanded(
            child: Bubble(elevation: 2,
              margin: BubbleEdges.only(top:10),
            radius: Radius.circular(26),
            alignment: Alignment.topRight,
            nip: BubbleNip.rightCenter,
            nipHeight: 10,
            nipWidth: 10,
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
              child: Text(comment.message,style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.end,),
            ),
            color: LightColors.bb,),
          ),
         CircleAvatar(backgroundImage: NetworkImage(comment.ImageURL),radius: 25,)
        ],
      );

    else
      return Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(comment.ImageURL),radius: 25,),
          Expanded(
            child: Bubble(elevation: 2,
              margin: BubbleEdges.only(top:10),
              radius: Radius.circular(25),
              alignment: Alignment.topLeft,
              nip: BubbleNip.leftCenter,
              nipHeight: 10,
              nipWidth: 10,
              child: Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                child: Text(comment.message,style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.start,),
              ),
              color:Colors.lightBlue,),
          ),

        ],
      );

  }



  Widget QuestionItem(Comment comment){
    return ClipRRect(
      borderRadius:BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
      child: Container(
        decoration: BoxDecoration(color: LightColors.white),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(comment.ImageURL),),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      Text("@"+comment.Username, style: TextStyle(color: LightColors.bb),),
                      Text("26/10/2021", style: TextStyle(color: Colors.grey,fontSize: 10),),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(comment.message,style: TextStyle(color:LightColors.bb,fontWeight: FontWeight.w800,fontSize: 20),textAlign: TextAlign.center,),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        color: Colors.pink,
                        width: 40,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left:2.0,top: 1), 
                          child: LikeButton(
                            isLiked :isloved,
                            likeBuilder: (bool isLiked) {
                              return Icon(
                               isLiked ?Icons.favorite:Icons.favorite_border_rounded,
                               color: Colors.white,
                                size: 30.0,
                      
                              );
                      
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${BlocProvider.of<ForumsCubit>(context).Comments.length}",style: TextStyle(color: Colors.pink,fontSize: 16),),
                  ),
                  Spacer(),
                  ClipOval(
                    child: Container(width: 40,
                    height: 40,
                    color: Colors.lightBlueAccent,
                    child: Icon(Icons.mode_comment_rounded,color: Colors.white,size: 25,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${BlocProvider.of<ForumsCubit>(context).Comments.length}",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 16),),
                  ),


                ],
              )

            ],
          ),
        ),),
    );

  }
}
