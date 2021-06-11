/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorage {
 
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  
  Future getValor(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

 
  Future put(String key, dynamic value) async {
    var shared = await SharedPreferences.getInstance();

    if (value is bool) shared.setBool(key, value);
    if (value is String) shared.setString(key, value);
    if (value is int) shared.setInt(key, value);
  }
}
