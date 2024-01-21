import 'package:twitterclone/constants.dart';
import 'package:twitterclone/exports.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Image.asset(
          twitter,
          fit: BoxFit.contain,
          height: 30,
        ),
      ),
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: true,
    );
  }
}
