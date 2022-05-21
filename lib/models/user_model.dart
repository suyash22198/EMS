class UserModel{
   String uid;
   bool isStudent;
  final String name;
  final String email;
  final String imageUrl;
  String? number;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.isStudent
  });

  setNumber (String? number) => this.number = number;
  
}