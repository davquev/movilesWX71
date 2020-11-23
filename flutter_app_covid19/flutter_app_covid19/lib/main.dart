import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutterappcovid19/models/country.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Country> countries;

  @override
  void initState(){
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Covid-19'),
      ),
      body: CountryList(countries: countries),
    );
  }

  Future _init() async {
    countries = List();
    List<Country> temp = await allCountries(http.Client());
    setState(() {
      countries = temp;
    });
  }
}

Future<List<Country>> allCountries(http.Client client) async{
  final response = await client.get('https://coronavirus-19-api.herokuapp.com/countries');
  print(response.statusCode);

  if (response.statusCode == 200){
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Country> countries = parsed.map<Country>((json) =>
    Country.fromJson(json)).toList();

    if(countries.length > 0){
      countries.removeAt(0);
    }

    return countries;
  }
  else{
    throw Exception('Error!!');
  }

}


class CountryList extends StatelessWidget {
  final List<Country> countries;
  CountryList({Key key,this.countries}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: countries.length,
      itemBuilder: (context, index){
        return buildrow(countries[index]);
      },
    );
  }
}

Widget buildrow(Country country) {
  return Card(
    elevation: 2.0,
    child: Padding(
      padding: EdgeInsets.only(bottom: 15.0, top: 15.0),
      child: ListTile(
        leading: Image.asset('lib/assets/mundo.jpg'),
        title: Text(
          country.country
        ),
        subtitle: Text(
          'Casos: '+country.cases.toString() + '\nMuertos: '+country.deaths.toString()
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: (){},
        ),
      ),
    ),
  );
}

