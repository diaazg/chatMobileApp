import 'package:chat/core/presentation/state/bloc/contact/contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactStateInit()){
    getContacts();
  }

  final List<String> _contacts = [];

  final List<String> _alphabet =
      List.generate(26, (index) => String.fromCharCode(index + 65));

  void getContacts() {
    List<String> fetchedContact = [
      'Amir',
      'Omar',
      'Mohammed',
      'Diaa',
      'Anoir',
      'Stika'
    ];
    _contacts.addAll(fetchedContact);
  }

  List<String> get contacts => _contacts;
  List<String> get alphabet => _alphabet;
}
