import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../failure/failure.dart';

final userSharedPrefsProvider = Provider<UserSharedPrefs>(
  (ref) => UserSharedPrefs(),
);

class UserSharedPrefs {
  late SharedPreferences _sharedPreferences;
  //set user token
  Future<Either<Failure, bool>> setUserToken(String token) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);
      return right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  //Get user token
  Future<Either<Failure, String>> getUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      String? token = _sharedPreferences.getString('token');
      if (token != null) {
        return right(token);
      } else {
        return Left(Failure(error: 'No token found'));
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
