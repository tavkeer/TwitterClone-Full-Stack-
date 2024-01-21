import 'package:twitterclone/exports.dart';

class IconTitle extends StatelessWidget {
  final IconData icon;
  final String value;
  const IconTitle({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 5),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        )
      ],
    );
  }
}
