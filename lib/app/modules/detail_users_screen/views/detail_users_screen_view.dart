import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/detail_user.dart';
import '../controllers/detail_users_screen_controller.dart';

class DetailUsersScreenView extends GetView<DetailUsersScreenController> {
  const DetailUsersScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final String username = Get.arguments;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details',
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              Icons.arrow_back_ios_new,
              key: const ValueKey<int>(1),
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // proses masukan ke favorite
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                Icons.favorite,
                key: const ValueKey<int>(1),
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blueAccent[700],
        elevation: 3,
      ),
      body: FutureBuilder<DetailUser?>(
        future: controller.fetchDetailUser(username),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text(
                "Data tidak tersedia.",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            );
          }

          final user = snapshot.data!;
          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Container(
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent[700]!, Colors.blue[300]!],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatarUrl),
                          radius: screenWidth * 0.15,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Center(
                        child: Text(
                          user.name,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Center(
                        child: Text(
                          user.email ?? '-',
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _infoRow(
                              Icons.location_on,
                              'Location',
                              user.location ?? '-',
                              screenWidth,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            _infoRow(
                              Icons.business,
                              'Company',
                              user.company ?? '-',
                              screenWidth,
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
        },
      ),
    );
  }

  Widget _infoRow(
      IconData icon, String label, String value, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blueAccent[700], size: screenWidth * 0.06),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Text(
            '$label: $value',
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
