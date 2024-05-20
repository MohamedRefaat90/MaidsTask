import '../../features/home/data/data_sources/db_helper.dart';
import 'sharedprefs.dart';
import '../di/dependency_injection.dart';

class AppServices {
  static init() async {
    SharedPreferencesService.initSharedPrefs();
    await DBHelper.initDB();

    await setUpGetIt();
  }
}
