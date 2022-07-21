
class Comment{
  late String message;
  late String Username;
  late String ImageURL;

  Comment.fromJson(Map<String,dynamic>JASON)
  {
    this.message = JASON['message'];
    this.Username= JASON['user']['name'];
    this.ImageURL = JASON['user']['image_url'];

  }


}