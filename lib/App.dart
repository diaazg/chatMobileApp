import 'package:chat/core/presentation/state/bloc/camera_bloc.dart/camera_cubit.dart';
import 'package:chat/core/presentation/state/bloc/chat_box/chat_box_cubit.dart';
import 'package:chat/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider<ChatBoxCubit>(
          create: (context) => ChatBoxCubit(),
        ),
         BlocProvider<CameraCubit>(
          create: (context) => CameraCubit(),
        ),

      ],
      child: MaterialApp(
        
        initialRoute: '/navigationScreen',
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
      ),
    );
  }
}
