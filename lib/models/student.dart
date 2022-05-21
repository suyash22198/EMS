class Student{
  String name;
  String email;
  String uid;
  int attendance;
  String number;
  String fatherName;
  String motherName;
  String photoUrl;
  String stream;
  String semester;
  bool isMarked;

  Student({
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.photoUrl,
    required this.semester,
    required this.stream,
    required this.number,
    required this.uid,
    required this.email,
    required this.attendance,
    required this.isMarked
  });
}