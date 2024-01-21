import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitterclone/exports.dart';
import 'package:twitterclone/models/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:twitterclone/features/home/utils/icon_title.dart';

class PostCardWidget extends StatelessWidget {
  final Post post;
  const PostCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //profile icon
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(post.profileImg!),
          ),
          const SizedBox(width: 10),

          //column of the username, postTtle and image
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //userName
                Row(
                  children: [
                    Text(
                      post.userName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      'assets/icons/verified.png',
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      convertTimestampToTimeAgo(post.createdAt!),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey[500],
                    ),
                  ],
                ),

                //title
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    post.title!,
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //image or video
                if (post.imgLink != "")
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: post.imgLink!,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),

                //other options like,comment, share etc
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTitle(
                        icon: CupertinoIcons.chat_bubble,
                        value: post.commentsCount.toString(),
                      ),
                      const IconTitle(
                        icon: Icons.repeat,
                        value: "",
                      ),
                      IconTitle(
                        icon: CupertinoIcons.heart,
                        value: post.likesCount.toString(),
                      ),
                      IconTitle(
                        icon: CupertinoIcons.chart_bar_alt_fill,
                        value: post.views.toString(),
                      ),
                      const IconTitle(
                        icon: Icons.share,
                        value: "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //more options icon
        ],
      ),
    );
  }

  String convertTimestampToTimeAgo(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp).toLocal();
    DateTime now = DateTime.now();

    Duration difference = now.difference(dateTime);

    if (difference.inHours < 24) {
      if (difference.inHours < 1) return "Just Now";
      return ' ${difference.inHours}h';
    } else {
      return DateFormat('dd MMM yy').format(dateTime);
    }
  }
}
