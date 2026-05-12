import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/data/model/user.dart';
import 'package:whatsapp_clone/data/remote/repository/firebase_repository.dart';
import 'package:whatsapp_clone/ui/contacts/cubit/contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  final FirebaseRepository repository;

  ContactsCubit({required this.repository}) : super(ContactsInitialState());

  void getAllUsers() async {
    emit(ContactsLoadingState());
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await repository
          .getAllUsers();
      emit(
        ContactsSuccessState(
          users: snapshot.docs
              .map<User>((e) => User.fromMap(e.data()))
              .toList(),
        ),
      );
    } catch (e) {
      emit(ContactsErrorState(errMessage: e.toString()));
    }
  }
}
