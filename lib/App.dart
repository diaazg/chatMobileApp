import 'package:chat/core/data/repo_imp/auth_repo_imp.dart';
import 'package:chat/core/presentation/state/bloc/auth/auth_cubit.dart';
import 'package:chat/utils/other/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key, required this.authRepoImp});

  final AuthRepoImp authRepoImp;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthCubit(authRepoImp))
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
      ),
    );
  }
}
