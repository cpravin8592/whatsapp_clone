import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/data/model/message.dart';
import 'package:whatsapp_clone/data/model/user.dart';
import 'package:whatsapp_clone/data/remote/repository/firebase_repository.dart';
import 'package:whatsapp_clone/domain/utils/app_utils.dart';
import 'package:whatsapp_clone/domain/utils/routes.dart';

import '../../domain/utils/app_colors.dart';
import '../../domain/utils/mock_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currUserId = "";

  @override
  void initState() {
    super.initState();
    getCurrUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.whatsAppGreen,
          foregroundColor: Colors.white,
          shape: RoundedSuperellipseBorder(borderRadius: .circular(16)),
        ),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.contacts),
        icon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.add_comment_rounded, size: 28),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: AppColors.whatsAppGreen,
            fontSize: 30,
            fontWeight: .w600,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.qr_code, size: 30)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt_rounded, size: 30),
          ),
          PopupMenuButton(
            position: .under,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Logout"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: .circular(16),
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height / 4,
                          margin: .symmetric(horizontal: 32),
                          padding: .all(16),
                          child: Column(
                            spacing: 16,
                            children: [
                              Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: .w700,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Do you really want to logout..?",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: .w500,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                spacing: 16,
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: Colors.green,
                                          width: 1.5,
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: .w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: Colors.red,
                                          width: 1.5,
                                        ),
                                      ),
                                      onPressed: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences.getInstance();
                                        await prefs.clear();
                                        Navigator.pushReplacementNamed(
                                          context,
                                          AppRoutes.login,
                                        );
                                      },
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: .w500,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
            child: Icon(Icons.more_vert_rounded, size: 30),
          ),
        ],
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
                Text("Ask Meta AI or Search", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseRepository.getContacts(currUserId),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  List<String> uids = snapshot.data!.docs.map<String>((e) {
                    List<dynamic> ids = e.data()["ids"];
                    ids.remove(currUserId);
                    return ids[0];
                  }).toList();
                  return ListView.builder(
                    itemCount: uids.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: FirebaseRepository.getUserFromUserId(
                          uids[index],
                        ),
                        builder: (ctx, userSnap) {
                          if (userSnap.hasData && userSnap.data!.exists) {
                            User user = User.fromMap(userSnap.data!.data()!);
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
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  user.name!,
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: .w600,
                                                  ),
                                                ),
                                              ),
                                              StreamBuilder(
                                                stream:
                                                    FirebaseRepository.getLastMessage(
                                                      currUserId,
                                                      user.userId!,
                                                    ),
                                                builder: (ctx, lastMsgSnap) {
                                                  if (lastMsgSnap.hasData &&
                                                      lastMsgSnap
                                                          .data!
                                                          .docs
                                                          .isNotEmpty) {
                                                    Message lastMsg =
                                                        Message.fromMap(
                                                          lastMsgSnap
                                                              .data!
                                                              .docs[0]
                                                              .data(),
                                                        );
                                                    return Row(
                                                      spacing: 4,
                                                      children: [
                                                        Text(
                                                          AppUtils.getMessageTime(
                                                            lastMsg.sentAt ?? 0,
                                                          ),
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: AppColors
                                                                .whatsAppGreen,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                  return const SizedBox.shrink();
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            spacing: 8,
                                            children: [
                                              Expanded(
                                                child: StreamBuilder(
                                                  stream:
                                                      FirebaseRepository.getLastMessage(
                                                        currUserId,
                                                        user.userId!,
                                                      ),
                                                  builder: (ctx, lastMsgSnap) {
                                                    if (lastMsgSnap.hasData &&
                                                        lastMsgSnap
                                                            .data!
                                                            .docs
                                                            .isNotEmpty) {
                                                      Message lastMsg =
                                                          Message.fromMap(
                                                            lastMsgSnap
                                                                .data!
                                                                .docs[0]
                                                                .data(),
                                                          );
                                                      return Row(
                                                        spacing: 4,
                                                        children: [
                                                          lastMsg.fromId ==
                                                                  currUserId
                                                              ? Icon(
                                                                  Icons
                                                                      .done_all_rounded,
                                                                  color:
                                                                      lastMsg.readAt !=
                                                                          null
                                                                      ? Colors
                                                                            .blueAccent
                                                                      : Colors
                                                                            .grey
                                                                            .shade500,
                                                                  size: 16,
                                                                  fontWeight:
                                                                      .w700,
                                                                )
                                                              : const SizedBox.shrink(),
                                                          Text(
                                                            lastMsg.message ??
                                                                "",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                    return const SizedBox.shrink();
                                                  },
                                                ),
                                              ),
                                              StreamBuilder(
                                                stream:
                                                    FirebaseRepository.getUnreadCount(
                                                      currUserId,
                                                      user.userId!,
                                                    ),
                                                builder: (ctx, unreadCntSnap) {
                                                  if (unreadCntSnap.hasData &&
                                                      unreadCntSnap
                                                          .data!
                                                          .docs
                                                          .isNotEmpty) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .whatsAppGreen,
                                                        shape: .circle,
                                                      ),
                                                      padding: .all(8),
                                                      child: Text(
                                                        "${unreadCntSnap.data!.docs.length}",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  return const SizedBox.shrink();
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  void getCurrUserId() async {
    currUserId = await FirebaseRepository.getCurrentUserId();
    setState(() {});
  }
}
