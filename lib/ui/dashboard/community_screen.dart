import 'package:flutter/material.dart';

import '../../domain/utils/app_colors.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Communities",
          style: TextStyle(fontSize: 28, fontWeight: .w400),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              margin: .zero,
              shape: RoundedRectangleBorder(borderRadius: .zero),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedSuperellipseBorder(
                                borderRadius: .circular(30),
                              ),
                              color: Colors.black38.withAlpha(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.groups,
                                size: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          top: 60,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.whatsAppGreen,
                              shape: .circle,
                            ),
                            child: Icon(
                              Icons.add_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Text(
                      "New Community",
                      style: TextStyle(fontSize: 22, fontWeight: .w600),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              margin: .only(top: 24),
              shape: RoundedRectangleBorder(borderRadius: .zero),
              elevation: 4,
              child: Padding(
                padding: .symmetric(vertical: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: ShapeDecoration(
                              shape: RoundedSuperellipseBorder(
                                borderRadius: .circular(30),
                              ),
                              color: Colors.grey.shade400,
                            ),
                            alignment: .center,
                            child: Text(
                              "AE",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: .bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Android Engineers",
                            style: TextStyle(fontSize: 22, fontWeight: .w600),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 32, thickness: 1, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            margin: .symmetric(horizontal: 16),
                            width: 72,
                            height: 72,
                            decoration: ShapeDecoration(
                              shape: RoundedSuperellipseBorder(
                                borderRadius: .circular(30),
                              ),
                              color: AppColors.whatsAppGreen.withAlpha(32),
                            ),
                            alignment: .center,
                            child: Icon(
                              Icons.campaign_rounded,
                              color: AppColors.whatsAppGreen,
                              size: 40,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                Row(
                                  mainAxisSize: .max,
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "Announcements",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: .w600,
                                      ),
                                    ),
                                    Text(
                                      "07:32 am",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: .w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  textAlign: .start,
                                  "Akshay : Have you read this blog so far",
                                  overflow: .ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            margin: .symmetric(horizontal: 16),
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: Colors.blue.withAlpha(32),
                            ),
                            alignment: .center,
                            child: Icon(
                              Icons.group_rounded,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                Row(
                                  mainAxisSize: .max,
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "Jobs",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: .w600,
                                      ),
                                    ),
                                    Text(
                                      "Yesterday",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: .w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  textAlign: .start,
                                  "+91 9765432122 joined from the community",
                                  overflow: .ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: .symmetric(horizontal: 56),
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 32,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "View all",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              margin: .only(top: 24),
              shape: RoundedRectangleBorder(borderRadius: .zero),
              elevation: 4,
              child: Padding(
                padding: .symmetric(vertical: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: ShapeDecoration(
                              shape: RoundedSuperellipseBorder(
                                borderRadius: .circular(30),
                              ),
                              color: Colors.grey.shade400,
                            ),
                            alignment: .center,
                            child: Text(
                              "MD",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: .bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Mobile App Developers",
                            style: TextStyle(fontSize: 22, fontWeight: .w600),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 32, thickness: 1, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            margin: .symmetric(horizontal: 16),
                            width: 72,
                            height: 72,
                            decoration: ShapeDecoration(
                              shape: RoundedSuperellipseBorder(
                                borderRadius: .circular(30),
                              ),
                              color: AppColors.whatsAppGreen.withAlpha(32),
                            ),
                            alignment: .center,
                            child: Icon(
                              Icons.campaign_rounded,
                              color: AppColors.whatsAppGreen,
                              size: 40,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                Row(
                                  mainAxisSize: .max,
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "Announcements",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: .w600,
                                      ),
                                    ),
                                    Text(
                                      "07:32 am",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: .w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  textAlign: .start,
                                  "Akshay : Have you read this blog so far",
                                  overflow: .ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            margin: .symmetric(horizontal: 16),
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: Colors.blue.withAlpha(32),
                            ),
                            alignment: .center,
                            child: Icon(
                              Icons.group_rounded,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                Row(
                                  mainAxisSize: .max,
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "Jobs",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: .w600,
                                      ),
                                    ),
                                    Text(
                                      "Yesterday",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: .w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  textAlign: .start,
                                  "+91 9765432122 joined from the community",
                                  overflow: .ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: .symmetric(horizontal: 56),
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 32,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "View all",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
