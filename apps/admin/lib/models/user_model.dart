class Player {
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String branch;
  final int year;
  final String contactNo;
  final String _id;
  final String createdAt;
  final String updatedAt;
  final int __v;

  Player(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.branch,
      required this.year,
      required this.contactNo,
      required String id,
      required this.createdAt,
      required this.updatedAt,
      required int v})
      : _id = id,
        __v = v;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'branch': branch,
      'year': year,
      'contactNo': contactNo,
      '_id': _id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': __v,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      role: map['role'] as String,
      branch: map['branch'] as String,
      year: map['year'] as int,
      contactNo: map['contactNo'] as String,
      id: map['_id'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      v: map['__v'] as int,
    );
  }
}
