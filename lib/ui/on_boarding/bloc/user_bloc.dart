import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/ui/on_boarding/bloc/user_event.dart';
import 'package:whatsapp_clone/ui/on_boarding/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseAuth auth;

  UserBloc({required this.auth}) : super(UserInitialState()) {
    on<LoginEvent>((event, emit) {});
    on<RegisterEvent>((event, emit) {});
  }
}
