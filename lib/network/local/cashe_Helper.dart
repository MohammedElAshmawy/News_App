import 'package:shared_preferences/shared_preferences.dart';

class cashHelper {

  static late SharedPreferences  sharedPreferences;

  static Init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
  required String key,
  required bool value,
   })async
   {
    return await sharedPreferences.setBool(key,value);
  }

  static  bool? getData({
    required String key,
  })
  {
    return sharedPreferences.getBool(key);
  }

}









