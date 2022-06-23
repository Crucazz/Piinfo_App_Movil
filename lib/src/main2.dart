import 'dart:convert';
import 'dart:ui';
import 'package:food_for_me/data_services/propaganda_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}


Future<List<Propaganda>> getPropaganda2() async{
  var response = await http.get(Uri.parse("http://host.nekmis.xyz:8000/core/app/propaganda/"));
  List<Propaganda> _propagandas = [];
  var data = jsonDecode(Utf8Decoder().convert(response.bodyBytes));
  for (var element in data){
    _propagandas.add(Propaganda.fromJson(element));
  }
  return _propagandas;
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


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food For me',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  PropagandaService propagandaService = PropagandaService();
  late List<Propaganda> propagandas;
  Future<Album>? futureAlbum;
  Future<List<Propaganda>>? propagandas2;
  @override
  void initState(){
    futureAlbum = fetchAlbum();
    super.initState();

  }


  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFe6e6e6),
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[700],
          leading: InkWell(child: Icon(Icons.menu, color: Colors.black)),
          actions: [


            Padding(
              padding: const EdgeInsets.all(12.0),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(),
                  onPressed: (){},
                  child: Text("cerar sesion", style: TextStyle())
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: size.height*0.1,
                  width: double.infinity,
                  child: TextField(
                    onChanged: (value){

                    },
                    decoration: InputDecoration(
                      hintText: 'Ingrese busqueda',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal:20.0 ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      prefixIcon: InkWell(
                        onTap: () {},
                        child: Icon(
                            Icons.search,color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    border: Border.all(color: Colors.black38)
                ),

                height: size.height*0.05,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      }
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6.0),
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text("tienda saddsadasdasdsasdasd1"),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6.0),
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text("tiendadasdasdasdda 2"),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6.0),
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text("tienda 2"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white
                    ),
                    onPressed: (){},
                    child: Text(
                        "Novedades",
                        style: TextStyle(color: Colors.black38)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white
                    ),
                    onPressed: (){},
                    child: Text(
                        "Ver Todo",
                        style: TextStyle(color: Colors.black38)),
                  ),
                ],
              ),


            ],
          ),
        )


    );


  }

}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}
