import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/my_application.dart';
import 'package:movie_app/core/observer/observer.dart';
import 'core/service_locator/service_locator.dart';

void main() 
async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await init();
  runApp(const MyApplication());
}

