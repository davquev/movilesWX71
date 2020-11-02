import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappnetworkbloc/simple_bloc_delegate.dart';
import 'package:flutterappnetworkbloc/app.dart';
import 'package:flutterappnetworkbloc/src/bloc/pokemons/pokemons_bloc.dart';
import 'package:flutterappnetworkbloc/src/repository/pokemon_repository.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  PokemonRepository pokemonRepository = PokemonRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PokemonsBloc>(
        create: (BuildContext context) =>
            PokemonsBloc(pokemonRepository: pokemonRepository),
      )
    ],
    child: MyApp(),
  ));
}