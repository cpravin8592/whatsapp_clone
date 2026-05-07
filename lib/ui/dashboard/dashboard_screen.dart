import 'package:flutter/material.dart';
import 'package:whatsapp_clone/domain/utils/app_colors.dart';
import 'package:whatsapp_clone/ui/dashboard/call_screen.dart';
import 'package:whatsapp_clone/ui/dashboard/chat_screen.dart';
import 'package:whatsapp_clone/ui/dashboard/community_screen.dart';
import 'package:whatsapp_clone/ui/dashboard/updates_screen.dart';
import 'package:whatsapp_clone/ui/dashboard/whatsapp_home.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIdx = 0;
  List<Widget> navScreens = [
    ChatScreen(),
    UpdatesScreen(),
    CommunityScreen(),
    CallScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: navScreens[selectedIdx]),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.message_outlined, size: 28),
            selectedIcon: Icon(
              Icons.message_rounded,
              color: AppColors.whatsAppGreen,
              size: 28,
            ),
            label: "Chats",
          ),
          NavigationDestination(
            icon: Icon(Icons.update_outlined, size: 28),
            selectedIcon: Icon(
              Icons.update_rounded,
              color: AppColors.whatsAppGreen,
              size: 28,
            ),
            label: "Updates",
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined, size: 28),
            selectedIcon: Icon(
              Icons.groups,
              color: AppColors.whatsAppGreen,
              size: 28,
            ),
            label: "Communities",
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined, size: 28),
            selectedIcon: Icon(
              Icons.call_rounded,
              color: AppColors.whatsAppGreen,
              size: 28,
            ),
            label: "Calls",
          ),
        ],
        indicatorColor: AppColors.whatsAppGreen.withAlpha(64),
        backgroundColor: Colors.white,
        elevation: 4,
        onDestinationSelected: (position) {
          debugPrint("Idx : $position");
          if (position != selectedIdx) {
            setState(() {
              selectedIdx = position;
            });
          }
        },
        selectedIndex: selectedIdx,
        labelTextStyle: WidgetStatePropertyAll(TextStyle(
          fontSize: 15,
          fontWeight: .w500
        )),
      ),
    );
  }
}
