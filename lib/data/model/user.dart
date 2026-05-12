class User {
  String? userId;
  String? name;
  String? email;
  int? createdAt;
  bool? isOnline = false;
  int? status = 1; //1-Active,2-Inactive,3-Suspended
  String? profilePic = "";
  int? profileStatus = 1; //1-Public,2-Friends,3-Private

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.isOnline,
    required this.status,
    required this.profilePic,
    required this.profileStatus,
  });

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "name": name,
    "email": email,
    "createdAt": createdAt,
    "isOnline": isOnline,
    "status": status,
    "profilePic": profilePic,
    "profileStatus": profileStatus,
  };

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map["userId"],
      name: map["name"],
      email: map["email"],
      createdAt: map["createdAt"],
      isOnline: map["isOnline"],
      status: map["status"],
      profilePic: map["profilePic"],
      profileStatus: map["profileStatus"],
    );
  }
}
