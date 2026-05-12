import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/data/remote/repository/firebase_repository.dart';
import 'package:whatsapp_clone/ui/on_boarding/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseRepository repository;

  LoginCubit({required this.repository}) : super(LoginInitialState());

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await repository.loginUser(email, password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(errMessage: e.toString()));
    }
  }
}
