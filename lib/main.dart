import 'dart:convert';
import 'dart:ui';
import 'package:food_for_me/data_services/propaganda_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';




import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Food-For-Me',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const PrincipalPage(),

      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onPressed: (){
                    Navigator.pushNamed(context, '/second');
                  },
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




  class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State createState() => _PrincipalPage();
  }

  class _PrincipalPage extends State<PrincipalPage> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
  FloatingActionButtonLocation.endDocked;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(

          backgroundColor: Color(0xFFe6e6e6),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.black, Colors.green],
                ),
              ),
              child: const AppBarContent(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Colors.black, Colors.green],
                      ),
                  ),

                  height: size.height*0.33,
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
                              color: Color(0xFFFFFFFF),
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Card(
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                child: Column(
                                  children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                            colors: <Color>[Colors.deepPurple, Colors.cyanAccent],
                                            ),
                                          ),
                                          child:
                                            Image.asset(
                                            "assets/images/pymes/vakita.png",
                                            height: 90,
                                          ),
                                        ),
                                     SizedBox(
                                      width: 150,
                                      height: 93,
                                      child: Column(
                                        children: [
                                          Text(
                                              'Agua Santa',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21)),
                                          Text(
                                              'Tienda Vegetariana',
                                              style: TextStyle(
                                                  fontSize: 17)),
                                          TextButton(
                                              onPressed: () {},
                                              child: Icon(Icons.navigate_next, color: Colors.black)),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.0),
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Card(
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: <Color>[Colors.deepPurple, Colors.cyanAccent],
                                          ),
                                        ),
                                        child:
                                        Image.asset(
                                          "assets/images/pymes/conejin.png",
                                          height: 140,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        height: 93,
                                        child: Column(
                                          children: [
                                            Text(
                                                'Emporio canela',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 21)),
                                            Text(
                                                'Tienda vegana',
                                                style: TextStyle(
                                                    fontSize: 17)),
                                            TextButton(
                                                onPressed: () {},
                                                child: Icon(Icons.navigate_next, color: Colors.black)),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.0),
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Card(
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: <Color>[Colors.deepPurple, Colors.cyanAccent],
                                          ),
                                        ),
                                        child:
                                        Image.asset(
                                          "assets/images/pymes/papitas.png",
                                          height: 100,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        height: 123,
                                        child: Column(
                                          children: [
                                            Text(
                                                'Armonia de Sabores',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 21)),
                                            Text(
                                                'Tienda Vegana',
                                                style: TextStyle(
                                                    fontSize: 17)),
                                            TextButton(
                                                onPressed: () {},
                                                child: Icon(Icons.navigate_next, color: Colors.black)),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.0),
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Card(
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: <Color>[Colors.deepPurple, Colors.cyanAccent],
                                          ),
                                        ),
                                        child:
                                        Image.asset(
                                          "assets/images/pymes/celiacos.png",
                                          height: 140,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        height: 93,
                                        child: Column(
                                          children: [
                                            Text(
                                                'Terramorea',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 21)),
                                            Text(
                                                'Tienda celiacos',
                                                style: TextStyle(
                                                    fontSize: 17)),
                                            TextButton(
                                                onPressed: () {},
                                                child: Icon(Icons.navigate_next, color: Colors.black)),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.0),
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Card(
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: <Color>[Colors.deepPurple, Colors.cyanAccent],
                                          ),
                                        ),
                                        child:
                                        Image.asset(
                                          "assets/images/pymes/fruteria.png",
                                          height: 140,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        height: 93,
                                        child: Column(
                                          children: [
                                            Text(
                                                'Effourt',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 21)),
                                            Text(
                                                'Tienda Vegetariana',
                                                style: TextStyle(
                                                    fontSize: 17)),
                                            TextButton(
                                                onPressed: () {},
                                                child: Icon(Icons.navigate_next, color: Colors.black)),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.0),
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Card(
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: <Color>[Colors.deepPurple, Colors.cyanAccent],
                                          ),
                                        ),
                                        child:
                                        Image.asset(
                                          "assets/images/pymes/ITCL.png",
                                          height: 140,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        height: 93,
                                        child: Column(
                                          children: [
                                            Text(
                                                'Tia MJ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 21)),
                                            Text(
                                                'Tienda animalista',
                                                style: TextStyle(
                                                    fontSize: 17)),
                                            TextButton(
                                                onPressed: () {},
                                                child: Icon(Icons.navigate_next, color: Colors.black)),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                          ),



                        ],
                      ),
                    ),
                  ),
                ), //todas las tiendas del primer roll
                SizedBox(height: size.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                            "Novedades",
                            style: TextStyle(fontSize: 20, color: Colors.black38)),
                        Icon(Icons.local_fire_department, color: Colors.red),
                      ],
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.deepOrange,
                        textStyle: const TextStyle(fontSize: 20, color: Colors.deepOrange),
                      ),
                      onPressed: () {},
                      child: const Text('Ver Todo'),
                    ),
                  ],
                ),
                SizedBox(height: size.height*0.02),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.0),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              Image.asset(
                                "assets/images/noticias/chocotorta.jpg",
                                height: 80,
                              ),
                            SizedBox(
                              width: 150,
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                      'Noticias sobre alimentos...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21)),
                                  Text(
                                      '21/06/2022',
                                      style: TextStyle(
                                          fontSize: 17)),
                                ],
                              ),
                            ),
                            Icon(Icons.more_horiz, color: Colors.black),

                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(height: size.height*0.02),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.0),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/noticias/sopa-de-tortillas.jpg",
                              height: 75,
                            ),
                            SizedBox(
                              width: 150,
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                      'Recetas Veganas ...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21)),
                                  Text(
                                      '13/06/2022',
                                      style: TextStyle(
                                          fontSize: 17)),
                                ],
                              ),
                            ),
                            Icon(Icons.more_horiz, color: Colors.black),

                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(height: size.height*0.02),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.0),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/noticias/img8.jpg",
                              height: 80,
                            ),
                            SizedBox(
                              width: 150,
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                      'Nutricionista responde...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21)),
                                  Text(
                                      '03/06/2022',
                                      style: TextStyle(
                                          fontSize: 17)),
                                ],
                              ),
                            ),
                            Icon(Icons.more_horiz, color: Colors.black),

                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(height: size.height*0.02),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.0),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/noticias/soporte.png",
                              height: 80,
                            ),
                            SizedBox(
                              width: 150,
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                      'Mantención...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21)),
                                  Text(
                                      '01/06/2022',
                                      style: TextStyle(
                                          fontSize: 17)),
                                ],
                              ),
                            ),
                            Icon(Icons.more_horiz, color: Colors.black),

                          ],
                        ),
                      ),
                    )
                ),

              ],
            ),
          ),
        floatingActionButton: _showFab
          ? FloatingActionButton(
            onPressed: () {},
            tooltip: 'Camara',
            backgroundColor: Colors.orange[900],
            child: const Icon(Icons.photo_camera, color: Colors.black),
          )
          : null,
          floatingActionButtonLocation: _fabLocation,
          bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: _fabLocation,
          shape: _showNotch ? const CircularNotchedRectangle() : null,
          ),
        ),
      );
    }
  }

  class _DemoBottomAppBar extends StatelessWidget {
    const _DemoBottomAppBar({
      this.fabLocation = FloatingActionButtonLocation.endDocked,
      this.shape = const CircularNotchedRectangle(),
    });

    final FloatingActionButtonLocation fabLocation;
    final NotchedShape? shape;

    static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
      FloatingActionButtonLocation.centerDocked,
      FloatingActionButtonLocation.centerFloat,
      ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.white,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              tooltip: 'Menu inicial',
              icon: const Icon(Icons.home,color: Colors.black),
              onPressed: () {
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) => const PrincipalPage()));
              },
            ),

            IconButton(
              tooltip: 'Noticias',
              icon: const Icon(Icons.grid_view,color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Notificaciones',
              icon: const Icon(Icons.notifications,color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Configuraciones',
              icon: const Icon(Icons.settings,color: Colors.black),
              onPressed: () {},
              ),
            Icon(Icons.settings,color: Colors.white),

            ],
          ),
        ),
      );
    }
  }



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey= GlobalKey<FormState>();
@override
  Widget build(BuildContext context){
  return Scaffold(
    body: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 60),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.green,
              ],
            ),
          ),
          child: Image.asset(
            "assets/images/logo.png",
            height: 300,
          ),

        ),
        SingleChildScrollView(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.only(left: 20,right: 20, top: 360),
            child: Padding(
              padding:
                const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Correo",
                        border: OutlineInputBorder()),
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "Este campo es obligatorio";
                          }
                          return null;
                        }
                    ),
                    SizedBox(height:30),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Contraseña",
                        border: OutlineInputBorder()),
                      obscureText: true,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "Este campo es obligatorio";
                          }
                          return null;
                        }
                    ),
                    SizedBox(height:30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange, // background
                          onPrimary: Colors.white,
                          elevation: 2),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          Navigator.push( context,
                              MaterialPageRoute(builder: (context) => const PrincipalPage()));

                        }
                      },
                      child: Text('Iniciar Sesión'),
                    ),

                    SizedBox(height:20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 2),
                      onPressed: () {
                        Navigator.push( context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));
                      },
                      child: Text('Registrarse'),
                    ),
                    SizedBox(height:35),
                    Text("By ITCL")


                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

}


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _formKey= GlobalKey<FormState>();
  String dropdownValue = 'Indefinido';
  String dropdownValue2 = 'Sin restricción';
  String dropdownValue3 = 'Sin restricción';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.green,
                ],
              ),
            ),
            child: Image.asset(
              "assets/images/logo.png",
              height: 300,
            ),

          ),
          SingleChildScrollView(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              margin: const EdgeInsets.only(left: 20,right: 20, top: 360),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: "Nombre Completo", border: OutlineInputBorder(),),
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "Este campo es obligatorio";
                          }
                          return null;
                        }
                      ),
                      SizedBox(height:30),
                      TextFormField(
                          decoration: InputDecoration(labelText: "Nombre de usuario", border: OutlineInputBorder(),),
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return "Este campo es obligatorio";
                            }
                            return null;
                          }
                      ),
                      SizedBox(height:30),
                      TextFormField(
                          decoration: InputDecoration(labelText: "Correo", border: OutlineInputBorder(),),
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return "Este campo es obligatorio";
                            }
                            return null;
                          }
                      ),
                      SizedBox(height:30),
                      TextFormField(
                          decoration: InputDecoration(labelText: "Edad", border: OutlineInputBorder(),),
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return "Este campo es obligatorio";
                            }
                            return null;
                          }
                      ),
                      SizedBox(height:30),

                      Row(
                        children: [
                          Text("Genero:           "),

                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),

                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                              ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['Indefinido', 'Femenino', 'Masculino']
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                              );
                            }).toList(),
                          ),

                        ]
                      )
                      ,
                      SizedBox(height:30),
                      Row(
                          children: [
                            Text("Restricción alimentaria 1: "),

                            DropdownButton<String>(
                              value: dropdownValue2,
                              icon: const Icon(Icons.arrow_downward),

                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                });
                              },
                              items: <String>['Sin restricción','Alergia','Celiaco', 'Colon irritable', 'Vegetariano', 'vegano']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),

                          ]
                      ),
                      Row(
                          children: [
                            Text("Restricción alimentaria 2: "),

                            DropdownButton<String>(
                              value: dropdownValue3,
                              icon: const Icon(Icons.arrow_downward),

                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue3 = newValue!;
                                });
                              },
                              items: <String>['Sin restricción','Celiaco','Alergia', 'Colon irritable', 'Vegetariano', 'vegano']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),

                          ]
                      ),
                      SizedBox(height:30),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Contraseña", border: OutlineInputBorder(),),
                        obscureText: true,
                        validator: (value){
                            if (value == null || value.isEmpty){
                              return "Este campo es obligatorio";
                            }
                            return null;
                          }
                      ),
                      SizedBox(height:30),
                      TextFormField(
                          decoration: InputDecoration(labelText: "Repetir Contraseña", border: OutlineInputBorder(),),
                          obscureText: true,
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return "Este campo es obligatorio";
                            }
                            return null;
                          }
                      ),
                      SizedBox(height:30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 2),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            Navigator.push( context,
                                MaterialPageRoute(builder: (context) => const LoginPage()));

                          }

                        },
                        child: Text('Crear Cuenta'),
                      ),
                      SizedBox(height:35),
                      Text("By ITCL")


                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}



class AppBarContent extends StatelessWidget {
  const AppBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.sort,
                      size: 20,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.my_location,
                      size: 20,
                    ),
                    color: Colors.deepOrange,
                    onPressed: () {},
                  ),
                  const Text(
                    'Av. Lo Cruzat, Quilicura',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: OutlinedButton.styleFrom(),
                      onPressed: () {
                        Navigator.push( context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: Text("cerar sesion", style: TextStyle())
                  )
                ],
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value){

                },
                decoration: InputDecoration(
                  hintText: 'Ingrese busqueda',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal:20.0 ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white54, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white54, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: Icon(
                        Icons.search,color: Colors.deepOrange),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}