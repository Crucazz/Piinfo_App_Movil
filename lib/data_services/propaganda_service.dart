import 'dart:convert';
import 'package:http/http.dart' as http;

class PropagandaService{
  Future<ListOfPropaganda> getPropaganda() async{
    var response = await http.get(Uri.parse("http://host.nekmis.xyz:8000/core/app/propaganda/"));
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