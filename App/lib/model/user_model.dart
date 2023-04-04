class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? secondName;


  UserModel({this.uid, this.email, this.firstname, this.secondName});

  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid:map['uid'],
      email: map['email'],
      firstname:map['firstName'],
      secondName: map['secondName']
    );
  }


Map<String, dynamic> toMap() {
  return {
    'uid': uid,
    'email': email,
    'firstName': firstname,
    'secondName': secondName,
  };
  }
}