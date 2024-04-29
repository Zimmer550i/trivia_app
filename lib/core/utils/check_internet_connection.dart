import 'package:connectivity/connectivity.dart';

Future<bool> hasInternetConnection() async {
  final connection = await Connectivity().checkConnectivity();

  if (connection == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}
