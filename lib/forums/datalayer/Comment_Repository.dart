
import 'package:untitled1newone/forums/datalayer/Comment_Model.dart';
import 'package:untitled1newone/forums/datalayer/CommentsAPI.dart';

class CommentsRepository{

  final CommentsAPI commentsAPI;


  CommentsRepository(this.commentsAPI);


  Future<List<Comment>> GetAllComments(dynamic Product_ID, String Token) async{
    final Comments = await commentsAPI.GetAllComments(Product_ID,Token );
    print("Repo");
    print(Comments.length);
    return Comments.map((SingleComment) =>Comment.fromJson(SingleComment)).toList();
  }


  Future AddComment(String Comment, String Token, dynamic product_id)async{
    await commentsAPI.AddComment(Comment, Token, product_id);
    print("comment added");

  }

}