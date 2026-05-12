import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/data/model/user.dart';
import 'package:whatsapp_clone/data/remote/repository/firebase_repository.dart';
import 'package:whatsapp_clone/ui/on_boarding/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseRepository repository;

  RegisterCubit({required this.repository}) : super(RegisterInitialState());

  void registerUser(User user, String pass) async {
    emit(RegisterLoadingState());
    try {
      await repository.registerUser(user, pass);
      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterErrorState(errMessage: e.toString()));
    }
  }
}
