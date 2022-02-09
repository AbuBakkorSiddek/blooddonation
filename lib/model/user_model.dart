class UserModel{
  String?uid;
  String?fullName;
  String?userName;
  String?email;
  String?phone;
  String?gender;
  String?bloodGroup;
  String?password;
  String?conformPassword;

  UserModel({this.uid, this.fullName, this.userName, this.email, this.phone,
    this.gender, this.bloodGroup, this.password, this.conformPassword});



  Map<String,dynamic>toMap(){
    return {
      'uid':uid,
      'fullName':fullName,
      'userName':userName,
      'email':email,
      'phone':phone,
      'gender':gender,
      'password':password,
      'conformPassword':conformPassword
    };
  }

  // reccive
  factory UserModel.fromMap(map){

    return UserModel(
     uid: map['uid'],
      fullName: map['fullName'],
      userName: map['userName'],
      email: map['email'],
      phone: map['phone'],
      gender: map['gender'],
      bloodGroup: map['bloodGroup'],
      password: map['password'],
      conformPassword: map['canformpassword']
    );
  }


}