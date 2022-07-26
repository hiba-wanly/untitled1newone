class User {
  String name, phoneNumber, email, photoUrl;

  User({

    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.photoUrl,
  });

  factory User.fromJson(Map json) {
    return User(
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        photoUrl: json['photo_url']);
  }

  Map<String ,String > toJson(){
    return {
      'name':name,
      'phone_number':phoneNumber,
      'photo_url':photoUrl,
    };
  }
}
