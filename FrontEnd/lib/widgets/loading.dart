import 'package:twitterclone/exports.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            height: 150,
            width: 150,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(
              'assets/icons/twitter.png',
            ),
          )
        ],
      ),
    );
  }
}
