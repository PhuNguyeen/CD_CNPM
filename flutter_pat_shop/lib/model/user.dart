class User {
  String userID;
  String userName;
  final String userPhone;
  String userPass;
  String userEmail;
  String userAvatar;
  String userRole;

  User(this.userID, this.userName, this.userPhone, this.userPass,
      this.userEmail, this.userAvatar, this.userRole);

  @override
  String toString() {
    return 'User{userID: $userID, userName: $userName, userPhone: $userPhone, userPass: $userPass, userEmail: $userEmail, userAvatar: $userAvatar, userRole: $userRole}';
  }

}
