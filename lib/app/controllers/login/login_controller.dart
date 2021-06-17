import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

class Login {}

String secret = "flutter";

main() async {
  var server = await HttpServer.bind(InternetAddress.anyIPv4, 4040);
  server.listen((request) {
    if (request.uri.path == "/login") {
      request.response.write(_generateToken());
    } else if (request.uri.path == "/teste") {
      request.response.write("Requisição teste");
    }

    if (_testToken(request)) {
      request.response.write("Seja bem vindo");
    } else
      request.response.write("Acesso negado");

    request.response.close();
  });
}

bool _testToken(HttpRequest request) {
  var token = request.headers["Authorization"]![0].split(" ")[1];
  var tokens = token.split(".");

  String header64 = tokens[0];
  String payload64 = tokens[1];

  Map payload = jsonDecode(utf8.decode(base64Decode(payload64)));
  String sign64 = tokens[2];

  var hmac = Hmac(sha256, secret.codeUnits);
  var digest = hmac.convert("$header64.$payload64".codeUnits);

  String sign = base64Encode(digest.bytes);

  return sign64 == sign &&
      DateTime.now().millisecondsSinceEpoch < payload["exp"];
}

String _generateToken() {
  //header
  var header = {
    "alg": "HS256",
    "typ": "JWT",
  };

  //codeUnits - passa header para bytes
  String header64 = base64Encode(jsonEncode(header).codeUnits);

  //payload (clams)
  //sub - id
  //exp - quanto tempo expira
  var payload = {
    "sub": 1,
    'name': "Leandro",
    "admin": false,
    "exp": DateTime.now().millisecondsSinceEpoch + 6000
  };

  String payload64 = base64Encode(jsonEncode(payload).codeUnits);

  //assinatura
  var hmac = Hmac(sha256, secret.codeUnits);
  var digest = hmac.convert("$header64.$payload64".codeUnits);

  String sign = base64Encode(digest.bytes);

  return "$header64.$payload64.$sign";
}
