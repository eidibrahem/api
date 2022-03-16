class Post  {
  final  userId;
  final id;
  final  title ;

  Post({required this.userId,required this.id,required this.title,}) ;
  factory Post.formj(Map <String,dynamic>parsedjson ){
    return(
        Post(userId:parsedjson["userId"],
            id: parsedjson["id"],
            title:parsedjson["title"],
            ));
  }

}