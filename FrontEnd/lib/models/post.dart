class Post {
  final int? id;
  final int? userId;
  final String? title;
  final int? views;
  final int? likesCount;
  final String? imgLink;
  final String? userName;
  final String? createdAt;
  final int? commentsCount;
  final String? description;
  final String? profileImg;

  Post({
    required this.id,
    required this.title,
    required this.views,
    required this.userId,
    required this.imgLink,
    required this.userName,
    required this.createdAt,
    required this.likesCount,
    required this.description,
    required this.commentsCount,
    required this.profileImg,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['ID'],
      userId: json['UserID'],
      title: json['Title'],
      views: json['Views'],
      likesCount: json['LikesCount'],
      imgLink: json['ImageLink'],
      userName: json['UserName'],
      createdAt: json['CreatedAt'],
      commentsCount: json['CommentsCount'],
      description: json['Description'],
      profileImg: json['ProfileImg'],
    );
  }
}
