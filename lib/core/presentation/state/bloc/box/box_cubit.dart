import 'package:chat/core/presentation/state/bloc/box/box_state.dart';
import 'package:chat/core/presentation/state/classes/validator_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxCubit extends Cubit<BoxState> {
  BoxCubit(this.validator) : super(BoxStateSuccess());

  final ValidatorOutput Function(String input) validator;

  final TextEditingController _controller = TextEditingController();

  String _input= '';

  TextEditingController get controller => _controller;

  String get input => _input;

  void validate() {
    ValidatorOutput validatorOutput = validator(_controller.text);

    if (validatorOutput.isValid) {
      _input = _controller.text;
      emit(BoxStateSuccess());
    } else {
      emit(BoxStateFailure(error: validatorOutput.error!));
    }
  }

  void check(String val,String errMsg){
     _input = _controller.text;
    if(val ==_input ){
          emit(BoxStateSuccess());
    }else{
          emit(BoxStateFailure(error: errMsg));
    }

  }
}
