import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class AuthService{
  final registrationUri =Uri.parse("http://127.0.0.1:8000/registration/");
  final loginUri = Uri.parse("http://127.0.0.1:8000/accounts/login/");



  Future<RegistrationResponse?> registration(String username, String password1, String password2, String email) async {
    var response = await http.post(registrationUri,body:{
      "username":username,
      "password1":password1,
      "password2":password2,
      "email":email,
    });
    return RegistrationResponse.fromJson(jsonDecode(response.body));
  }

  Future<LoginResponse?> Login(
      String usernameOremail, String password) async {
    var response = await http.post(loginUri, body: {
      "username":usernameOremail,
      "password":password,
    });
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

}

//autenticacion y preparacion de un mensaje de respuesta
class RegistrationResponse {
  List <dynamic>? non_fields_errors;
  List <dynamic>? password1;
  List <dynamic>? username;
  List <dynamic>? email;
  dynamic? key;

  RegistrationResponse(
      {this.email,
        this.key,
        this.non_fields_errors,
        this.password1,
        this.username});
  factory RegistrationResponse.fromJson(mapOfBody){
    return RegistrationResponse(
      email: mapOfBody["email"],
      key: mapOfBody["key"],
      non_fields_errors: mapOfBody["non_fields_errors"],
      password1: mapOfBody["password1"],
      username: mapOfBody["username"],
    );
  }


}




class LoginResponse{
  dynamic? key;
  List<dynamic>? non_fields_errors;
  LoginResponse({this.key, this.non_fields_errors});

  factory LoginResponse.fromJson(mapOfBody){
    return LoginResponse(
        key: mapOfBody['key'],
        non_fields_errors: mapOfBody['non_fields_errors']
    );
  }
}