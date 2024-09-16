import 'package:chat/core/presentation/state/bloc/invitation/invitation_cubit.dart';
import 'package:chat/core/presentation/state/bloc/invitation/invitation_state.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/snacks.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvitationsScreen extends StatefulWidget {
   InvitationsScreen({super.key});

  @override
  State<InvitationsScreen> createState() => _InvitationsScreenState();
}

class _InvitationsScreenState extends State<InvitationsScreen> {
  final bloc = InvitationCubit();

  @override
  void initState() {
    bloc.getInvitations();
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
      body: BlocConsumer<InvitationCubit,InvitationState>(
        bloc:bloc ,
        listener: (context, state) {
          if (state is InvitationAcceptSuccess){
            showSnackBar("Invitation accepted successfuly", Colors.green,context);
          }
        },
        builder: (context,state) {
         if(state is InvitationStateGetSuccess || state is InvitationAcceptSuccess){
           if(bloc.invitations.isNotEmpty){
            return SizedBox(
            height: 700,
            child: ListView.builder(
              itemCount: bloc.invitations.length,
              itemBuilder: (context,index){
                return ListTile(
                        title: Text(
                          bloc.invitations[index].sid.toString(),
                          style: titleBold.copyWith(
                              fontSize: ktextSize1 + 5, color: Colors.black),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            bloc.acceptInvitation(bloc.invitations[index].sid);
                          },
                          child: Icon(
                            Icons.add_task_sharp,
                            color: greenColors['mainGreen'],
                          ),
                        ),
                      );
              }),
          );
        
           }else{
              return const Center(
              child: Text(
            'No invitation',
            style: TextStyle(color: Colors.black),
          ));
           }
        
         }else if (state is InvitationStateGetFailure){
          
          return const Center(
              child: Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ));
         }else{
          
          return const Center(
              child: Text(
            'Wait....................',
            style: TextStyle(color: Colors.black),
          ));
         }
        }
      ),
    ));
  }
}