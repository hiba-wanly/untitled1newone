


import 'package:untitled1newone/forums/datalayer/Comment_Model.dart';

abstract class ForumsStates{}

class ForumsInitialState extends ForumsStates{}

class ForumsLoadingState extends ForumsStates{}

class CommentsLoaded extends ForumsStates {
  final List<Comment> Comments;

  CommentsLoaded(this.Comments);
}

class NetworkErrorState extends ForumsStates{}