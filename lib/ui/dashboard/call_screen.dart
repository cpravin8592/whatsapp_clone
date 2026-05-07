import 'package:flutter/material.dart';

import '../../domain/utils/app_colors.dart';
import '../../domain/utils/mock_data.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Calls", style: TextStyle(fontSize: 28, fontWeight: .w400)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded, size: 30),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          SizedBox(
            height: 160,
            child: ListView(
              padding: .all(16),
              shrinkWrap: true,
              scrollDirection: .horizontal,
              children: [
                Column(
                  crossAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: .all(20),
                        decoration: BoxDecoration(
                          color: Colors.black12.withAlpha(8),
                          shape: .circle,
                        ),
                        child: Icon(Icons.call_outlined, size: 32),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Call", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: .all(20),
                        decoration: BoxDecoration(
                          color: Colors.black12.withAlpha(8),
                          shape: .circle,
                        ),
                        child: Icon(Icons.calendar_month_outlined, size: 32),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Schedule", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: .all(20),
                        decoration: BoxDecoration(
                          color: Colors.black12.withAlpha(8),
                          shape: .circle,
                        ),
                        child: Icon(Icons.dialpad_outlined, size: 32),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Keypad", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: .all(20),
                        decoration: BoxDecoration(
                          color: Colors.black12.withAlpha(8),
                          shape: .circle,
                        ),
                        child: Icon(Icons.favorite_border_outlined, size: 32),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Favourite", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 8, left: 16),
            child: Text(
              "Recent",
              style: TextStyle(fontSize: 24, fontWeight: .w600),
              textAlign: .start,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: callLogs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: .all(16),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: callLogs[index].bgColor.withAlpha(
                              32,
                            ),
                            radius: 36,
                            child: Center(
                              child: Text(
                                callLogs[index].initials,
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontSize: 28,
                                  fontWeight: .w600,
                                  color: callLogs[index].bgColor,
                                ),
                                textAlign: .center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: .stretch,
                            mainAxisSize: .min,
                            children: [
                              Text(
                                callLogs[index].name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: .w500,
                                  color: callLogs[index].callType > 2
                                      ? Colors.red
                                      : Colors.black,
                                ),
                                textAlign: .start,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    callLogs[index].callType == 1 ||
                                            callLogs[index].callType == 3
                                        ? Icons.call_received
                                        : Icons.call_made,
                                    color: callLogs[index].callType > 2
                                        ? Colors.red
                                        : AppColors.whatsAppGreen,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      callLogs[index].callTime,
                                      style: TextStyle(
                                        fontSize: 18,
                                        overflow: .ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        callLogs[index].callMode == "A"
                            ? Icons.call_outlined
                            : Icons.video_camera_back_outlined,
                        size: 32,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
