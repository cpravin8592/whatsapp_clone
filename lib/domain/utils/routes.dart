import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/data/remote/repository/firebase_repository.dart';
import 'package:whatsapp_clone/ui/contacts/contacts_page.dart';
import 'package:whatsapp_clone/ui/contacts/cubit/contacts_cubit.dart';
import 'package:whatsapp_clone/ui/chat/chat_screen.dart';
import 'package:whatsapp_clone/ui/on_boarding/login/cubit/login_cubit.dart';
import 'package:whatsapp_clone/ui/on_boarding/login/login_screen.dart';

import '../../ui/dashboard/dashboard_screen.dart';
import '../../ui/on_boarding/register/cubit/register_cubit.dart';
import '../../ui/on_boarding/register/register_screen.dart';
import '../../ui/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String contacts = '/contacts';
  static const String chats = '/chats';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => SplashScreen(),
    login: (_) => RepositoryProvider(
      create: (_) => FirebaseRepository(),
      child: BlocProvider(
        create: (context) => LoginCubit(
          repository: RepositoryProvider.of<FirebaseRepository>(context),
        ),
        child: LoginScreen(),
      ),
    ),
    register: (_) => RepositoryProvider(
      create: (_) => FirebaseRepository(),
      child: BlocProvider(
        create: (context) => RegisterCubit(
          repository: RepositoryProvider.of<FirebaseRepository>(context),
        ),
        child: RegisterScreen(),
      ),
    ),
    dashboard: (_) => const DashboardScreen(),
    contacts: (_) => RepositoryProvider(
      create: (_) => FirebaseRepository(),
      child: BlocProvider(
        create: (context) => ContactsCubit(
          repository: RepositoryProvider.of<FirebaseRepository>(context),
        ),
        child: const ContactsPage(),
      ),
    ),
    chats: (_) => ChatScreen(),
  };
}
