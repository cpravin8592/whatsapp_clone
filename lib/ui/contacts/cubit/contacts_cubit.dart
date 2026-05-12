import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/data/model/user.dart';
import 'package:whatsapp_clone/data/remote/repository/firebase_repository.dart';
import 'package:whatsapp_clone/domain/constants/app_constants.dart';
import 'package:whatsapp_clone/ui/contacts/cubit/contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  final FirebaseRepository repository;

  ContactsCubit({required this.repository}) : super(ContactsInitialState());

  void getAllUsers() async {
    emit(ContactsLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currUserId = prefs.getString(AppConstants.keyUserId) ?? "";
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await repository
          .getAllUsers();
      List<User> users = snapshot.docs
          .map<User>((e) => User.fromMap(e.data()))
          .toList();
      users.removeWhere((user) => user.userId == currUserId);
      emit(ContactsSuccessState(users: users));
    } catch (e) {
      emit(ContactsErrorState(errMessage: e.toString()));
    }
  }
}
