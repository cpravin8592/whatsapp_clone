import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/data/model/user.dart';
import 'package:whatsapp_clone/domain/utils/app_colors.dart';
import 'package:whatsapp_clone/domain/utils/app_utils.dart';
import 'package:whatsapp_clone/domain/utils/routes.dart';
import 'package:whatsapp_clone/ui/contacts/cubit/contacts_cubit.dart';
import 'package:whatsapp_clone/ui/contacts/cubit/contacts_state.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ContactsCubit>().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.whatsAppGreen,
        title: Text(
          "All Contacts",
          style: TextStyle(fontSize: 20, fontWeight: .w500),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: .all(16),
            padding: .symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black12.withAlpha(06),
              borderRadius: .circular(32),
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded, size: 28),
                SizedBox(width: 16),
                Text("Search by name or email", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                if (state is ContactsLoadingState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: .center,
                      spacing: 16,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.whatsAppGreen,
                        ),
                        Text("Getting Contacts.."),
                      ],
                    ),
                  );
                } else if (state is ContactsSuccessState) {
                  if (state.users.isEmpty) {
                    return Center(
                      child: Text(
                        "No Users Found!",
                        style: TextStyle(fontSize: 20, fontWeight: .w500),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      User user = state.users[index];
                      final Color bgColor =
                          AppColors.dpBgColors[Random().nextInt(
                            AppColors.dpBgColors.length - 1,
                          )];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.chats,
                            arguments: user,
                          );
                        },
                        child: Padding(
                          padding: .all(16),
                          child: Row(
                            spacing: 16,
                            children: [
                              CircleAvatar(
                                backgroundColor: bgColor.withAlpha(32),
                                radius: 36,
                                child: Center(
                                  child: Text(
                                    AppUtils.getInitials(user.name!),
                                    style: TextStyle(
                                      letterSpacing: 1.5,
                                      fontSize: 28,
                                      fontWeight: .w600,
                                      color: bgColor,
                                    ),
                                    textAlign: .center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: .start,
                                  mainAxisSize: .min,
                                  children: [
                                    Text(
                                      user.name!,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: .w600,
                                      ),
                                    ),
                                    Text(
                                      user.email!,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ContactsErrorState) {
                  return Center(child: Text(state.errMessage));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
