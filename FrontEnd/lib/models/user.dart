class User {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? userName;
  String? followers;
  String? following;
  String? profileImage;
  String? dateOfBirth;
  String? location;
  String? postCount;
  String? website;

  User(
      {this.createdAt,
      this.updatedAt,
      this.id,
      this.email,
      this.userName,
      this.followers,
      this.following,
      this.profileImage,
      this.dateOfBirth,
      this.location,
      this.postCount,
      this.website});

  User.fromJson(Map<String, dynamic> json) {
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    id = json['ID'];
    email = json['Email'];
    userName = json['UserName'];
    followers = json['Followers'];
    following = json['Following'];
    profileImage = json['ProfileImage'];
    dateOfBirth = json['DateOfBirth'];
    location = json['Location'];
    postCount = json['PostCount'];
    website = json['Website'];
  }
}
