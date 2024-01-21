import 'package:twitterclone/constants.dart';
import 'package:twitterclone/exports.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

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
      foregroundColor: Colors.grey[500],
      backgroundColor: Colors.black,
      automaticallyImplyLeading: true,
      leading: const SizedBox(
        child: Icon(Icons.person, size: 30),
      ),
      actions: const [
        Icon(Icons.settings, size: 30),
        SizedBox(width: 8),
      ],
    );
  }
}
