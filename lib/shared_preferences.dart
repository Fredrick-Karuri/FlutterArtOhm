import 'package:shared_preferences/shared_preferences.dart';

class Prefs{
  Future addStringToSF( String key, String val ) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString(key, val);
  }

  Future getStringValuesSF( String key, String val ) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    final image=  prefs.getString(key);
    return image ;
  }

  Future addBooleanToSF( String key, bool val ) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setBool(key, val);
  }
}
