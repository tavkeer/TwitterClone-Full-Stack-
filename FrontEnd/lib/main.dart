import 'exports.dart';
import 'package:twitterclone/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('token');

  runApp(const MyApp());
}
