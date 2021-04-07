/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

class ItemDropdDown {
  String? id;
  String? title;
  String? id2;

  ItemDropdDown({required this.id, required this.title});

  ItemDropdDown.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['id'].toString();
      title = json['title'].toString();
    }
  }
}
