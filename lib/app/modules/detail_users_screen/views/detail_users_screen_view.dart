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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details',
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Icon(
              Icons.arrow_back_ios_new,
              key: ValueKey<int>(1),
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: IconButton(
              onPressed: () {
                // proses masukan ke favorite
              },
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: Icon(
                  Icons.favorite,
                  key: ValueKey<int>(1),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blueAccent[700],
        elevation: 2,
      ),
      body: FutureBuilder<DetailUser?>(
        future: controller.fetchDetailUser(username),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent[700],
              ),
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

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatarUrl),
                    radius: 50,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Name: ${user.name}',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Email: ${user.email ?? '-'}',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Location: ${user.location}',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Company: ${user.company}',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
