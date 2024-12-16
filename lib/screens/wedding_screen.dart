import 'package:craftmyplate/utils/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/bulkfoodtab.dart';
import '../widgets/catering_service_tab.dart';

class WeddingScreen extends StatelessWidget {
  const WeddingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // For "Bulk Food Delivery" and "Catering Service" tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200), // AppBar height
          child: AppBar(
            title: const Text(
              'Wedding',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Stack(
              children: [
                // Background Image
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      scale: 30.0,
                      image: AssetImage(
                        'assets/Wedding.png', // Replace with actual image URL
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient Overlay for better text visibility
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                // AppBar Content
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Back Button
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              splashBorderRadius: BorderRadius.circular(12.0),
              labelColor: primaryColor,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.transparent,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              indicator: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Tab(text: "Bulk Food Delivery"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Tab(text: "Catering Service"),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            BulkFoodDeliveryTab(),
            CateringServiceTab(),
          ],
        ),
      ),
    );
  }
}
