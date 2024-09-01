import 'package:chat/core/presentation/state/bloc/box/box_cubit.dart';
import 'package:chat/core/presentation/state/bloc/box/box_state.dart';
import 'package:chat/utils/colors.dart';
import 'package:chat/utils/sizes.dart';
import 'package:chat/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFormFieldWidget extends StatelessWidget {
  const CustomFormFieldWidget({
    super.key,
    required this.title,
    required this.obscure,
    required this.cubit,
  });

  final String title;
  final bool obscure;
  final BoxCubit cubit;

  @override
  Widget build(BuildContext context) {
    final String capitalizedTitle = title[0].toUpperCase() + title.substring(1);
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          return TextFormField(
              controller: cubit.controller,
              validator: (val) =>
                  (state is BoxStateFailure) ? state.error : null,
              obscureText: obscure,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                label: Text(
                  capitalizedTitle,
                  style: titleMedium.copyWith(
                      color: greenColors['mainGreen'], fontSize: ktextSize1),
                ),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: formFieldBorderColor['errorBorder']!)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: formFieldBorderColor['focuseBorder']!)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: formFieldBorderColor['enabledBorder']!),
                ),
              ));
        });
  }
}
