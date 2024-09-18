import 'package:chat/core/data/data_sources/local/local_auth.dart';
import 'package:chat/core/data/models/user_model.dart';
import 'package:chat/core/presentation/state/bloc/invitation/invitation_cubit.dart';
import 'package:chat/core/presentation/state/bloc/invitation/invitation_state.dart';
import 'package:chat/core/presentation/state/bloc/people/people_cubit.dart';
import 'package:chat/core/presentation/state/bloc/people/people_state.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchPeopleScreen extends StatelessWidget {
  SearchPeopleScreen({super.key});
  late UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => PeopleCubit(),
        child: BlocConsumer<PeopleCubit, PeopleState>(
            listener: (context, state) async {
          userModel = await getUserInfoFromLocalStorage();
        }, builder: (context, state) {
          final cubit = context.read<PeopleCubit>();
          if (state is PeopleStateSuccess) {
            return BlocProvider(
              create: (context) => InvitationCubit(),
              child: BlocConsumer<InvitationCubit, InvitationState>(
                  listener: (context, state) {
                if (state is InvitationStateSendSuccess) {
                  cubit.removeEelement(state.id);
                  print("Send inv to person with id : ${state.id}");
                } else if (state is InvitationStateSendFailure) {
                  print("err------------------------------");
                }
              }, builder: (context, state) {
                return ListView.builder(
                    itemCount: cubit.peoples.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          cubit.peoples[index].username ?? '',
                          style: titleBold.copyWith(
                              fontSize: ktextSize1 + 5, color: Colors.black),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            context.read<InvitationCubit>().sendInvittation(
                                userModel.uid!, cubit.peoples[index].uid!);
                          },
                          child: Icon(
                            Icons.person_add_alt_1,
                            color: greenColors['mainGreen'],
                          ),
                        ),
                      );
                    });
              }),
            );
          } else if (state is PeopleStateFailure) {
            return Center(
              child: Text(state.err),
            );
          } else {
            return const Center(
              child: Text('wait..........'),
            );
          }
        }),
      ),
    ));
  }
}
