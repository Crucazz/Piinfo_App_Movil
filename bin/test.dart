import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

main() async {
  ListOfPropaganda listOfPropaganda = await PropagandaService().getPropaganda();
  print(listOfPropaganda.propagandas[0].nombre_producto );


}


class PropagandaService{
  Future<ListOfPropaganda> getPropaganda() async{
    var response = await http.get(Uri.parse("http://127.0.0.1:8000/core/app/propaganda/"));
    return ListOfPropaganda.fromList(
        jsonDecode(Utf8Decoder().convert(response.bodyBytes)));
  }
}

class ListOfPropaganda{
  List<Propaganda> propagandas;
  ListOfPropaganda({required this.propagandas});
  factory ListOfPropaganda.fromList(List list){
    List<Propaganda> _propagandas = [];
    for (var element in list){
      _propagandas.add(Propaganda.fromJson(element));
    }

    return ListOfPropaganda(propagandas: _propagandas);
  }
}

class Propaganda{
  int id;
  String nombre_producto;
  int pyme;
  String descripcion;
  Propaganda({
    required this.id,
    required this.nombre_producto,
    required this.pyme,
    required this.descripcion,
  });

  factory Propaganda.fromJson(map){
    return Propaganda(
        id: map['id'],
        nombre_producto: map['nombre_producto'],
        pyme: map['pyme'],
        descripcion: map['descripcion']);
  }

}
previusmain() async{

  AuthService authService = AuthService();
  RegistrationResponse? registrationResponse= await authService.registration("felipe9","salvadorsan1912","salvadorsan1912","felipe9@gmail.com");
    if(registrationResponse!=null){
      if(registrationResponse.email!=null) {
        registrationResponse.email!.forEach((element) {
        print(element);
        });
      }

    }

}
/*

//var response= await http.get(Uri.parse("http://127.0.0.1:8000/core/"));
  AuthService authService = AuthService();
  RegistrationResponse? registrationResponse= await authService.registration("felipe9","salvadorsan1912","salvadorsan1912","felipe9@gmail.com");
  if(registrationResponse!=null){
    if(registrationResponse.email!=null) {
      registrationResponse.email!.forEach((element) {
        print(element);
      });
    }

    if(registrationResponse.username!=null) {
      registrationResponse.username!.forEach((element) {
        print(element);
      });
    }

    if(registrationResponse.password1!=null) {
      registrationResponse.password1!.forEach((element) {
        print(element);
      });
    }

    if(registrationResponse.key!=null) {
      print(registrationResponse.key);
    }

  }

  LoginResponse? loginResponse= await authService.Login("felipe9","salvadorsan1912");
  if ( loginResponse != null)
    {
      if(loginResponse.key!= null) print(loginResponse.key);
      if(loginResponse.non_fields_errors!=null)
        loginResponse.non_fields_errors!.forEach((element) {print(element);});
    }
  var response2 = await http.get(Uri.parse("http://127.0.0.1:8000/accounts/user/"),
  headers: {
    "Authorization":"Token "+loginResponse!.key,
  });
  print(response2.body);
  print(loginResponse.key);
  var response3 = await http.get(Uri.parse("http://127.0.0.1:8000/accounts/logout/"),
      headers: {
        "Authorization":"Token "+loginResponse!.key,
      });


 */
//Creacion del usuario
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