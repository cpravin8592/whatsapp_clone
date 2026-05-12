import 'package:whatsapp_clone/data/model/user.dart';

abstract class ContactsState {}

class ContactsInitialState extends ContactsState {}

class ContactsLoadingState extends ContactsState {}

class ContactsSuccessState extends ContactsState {
  final List<User> users;

  ContactsSuccessState({required this.users});
}

class ContactsErrorState extends ContactsState {
  final String errMessage;

  ContactsErrorState({required this.errMessage});
}
