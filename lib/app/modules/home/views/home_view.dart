import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/user.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Github Apps Demo',
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent[700],
        elevation: 2,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                Icons.info_rounded,
                key: ValueKey<int>(1),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
              decoration: BoxDecoration(
                color: Colors.blueAccent[700],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                labelStyle: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.person),
                    text: "Popular",
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                    text: "Favorite",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder<List<User>>(
                    future: controller.getAllUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.blueAccent[700],
                          ),
                        );
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            "Mohon maaf, tidak ada data yang tersedia!",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          User user = snapshot.data![index];

                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                Routes.DETAIL_USERS_SCREEN,
                                arguments: user.login,
                              );
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                              ),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: Colors.white,
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.all(screenWidth * 0.05),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    user.avatarUrl,
                                    height: screenWidth * 0.15,
                                    width: screenWidth * 0.15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  user.login,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.black87,
                                  ),
                                ),
                                subtitle: Text(
                                  user.type,
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: screenWidth * 0.05,
                                  color: Colors.blueAccent[700],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Center(
                    child: Text(
                      "Tab Favorite",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
