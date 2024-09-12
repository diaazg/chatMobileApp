import 'package:chat/core/presentation/state/bloc/people/people_cubit.dart';
import 'package:chat/core/presentation/state/bloc/people/people_state.dart';
import 'package:chat/utils/other/colors.dart';
import 'package:chat/utils/other/sizes.dart';
import 'package:chat/utils/other/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPeopleScreen extends StatelessWidget {
  const SearchPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => PeopleCubit(),
        child: BlocBuilder<PeopleCubit,PeopleState>(
          builder: (context,state) {
            final cubit = context.read<PeopleCubit>();
            if(state is PeopleStateSuccess){
              return ListView.builder(
              itemCount: cubit.peoples.length,
              itemBuilder: (context,index){
                return ListTile(
                                title: Text(
                                  cubit.peoples[index].username??'',
                                  style: titleBold.copyWith(
                                      fontSize: ktextSize1 + 5, color: Colors.black),
                                ),
                                 trailing: Icon(
                                Icons.person_add_alt_1,
                                color: greenColors['mainGreen'],
                              ),
                              );
              });
            }else if(state is PeopleStateFailure){
              return Center(child: Text(state.err),);
            }else{
              return const Center(child: Text('wait..........'),);
            }
          }
        ),
      ),

    ));
  }
}
