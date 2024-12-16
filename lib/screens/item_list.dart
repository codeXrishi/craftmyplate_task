import 'package:craftmyplate/controllers/order_controller.dart';
import 'package:craftmyplate/models/recipes_model.dart';
import 'package:craftmyplate/screens/fill_details.dart';
import 'package:craftmyplate/screens/wedding_screen.dart';
import 'package:craftmyplate/utils/constant.dart';
import 'package:craftmyplate/widgets/custom_gridview.dart';
import 'package:craftmyplate/widgets/custom_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  OrderController controller = Get.put(OrderController());
  final List<RecipesModel> recipes = [
    RecipesModel(title: 'idli', imageUrl: 'assets/idli.png'),
    RecipesModel(title: 'Appam', imageUrl: 'assets/appam.png'),
    RecipesModel(title: 'Dosa', imageUrl: 'assets/dosa.png'),
    RecipesModel(title: 'Wada', imageUrl: 'assets/wada.png'),
    RecipesModel(title: 'Pongal', imageUrl: 'assets/khichdi.png'),
    RecipesModel(title: 'Bonda', imageUrl: 'assets/bonda.png'),
  ];

  final bool selected = false;

  final Set<int> addedItems = {};

  int selectedIndex = -1;

  void toggleItem(int index) {
    setState(() {
      if (addedItems.contains(index)) {
        addedItems.remove(index);
      } else {
        addedItems.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Determine the number of columns based on screen width
    int crossAxisCount =
        screenWidth < 600 ? 2 : 4; // 2 columns for mobile, 4 for tablets
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 80,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: const Center(
                child: Text(
                  'Add Ons',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price Per Plate',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'LexendFont'),
                      ),
                      Text(
                        '₹240/Plate',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'LexendFont'),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(() => const FillDetails());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(.9),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        'Fill Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'LexendFont',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                50,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Get.offAll(() => const WeddingScreen());
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            const Text(
              'South Indian Breakfast',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Icon(
              Iconsax.edit,
              size: 15,
              color: Colors.grey[500],
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffF5F6FB),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      blurStyle: BlurStyle.normal),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomSidebar(
                    url: 'assets/samosa.png',
                    title: 'Starters',
                    amount: '2/2',
                    bgColor: Colors.green.shade100,
                    borderColor: Colors.green,
                    titleColor: Colors.black,
                    textColor: Colors.black,
                    firstColor: selectedIndex == 0
                        ? primaryColor.withOpacity(.4)
                        : Colors.transparent,
                    secondColor: selectedIndex == 0
                        ? Colors.transparent
                        : Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomSidebar(
                    url: 'assets/chicken.png',
                    title: 'Mains',
                    amount: '2/2',
                    bgColor: Colors.deepPurple,
                    borderColor: Colors.transparent,
                    textColor: Colors.white,
                    titleColor: Colors.deepPurple,
                    firstColor: selectedIndex == 1
                        ? primaryColor.withOpacity(.4)
                        : Colors.transparent,
                    secondColor: selectedIndex == 1
                        ? Colors.transparent
                        : Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomSidebar(
                    url: 'assets/sweet.png',
                    title: 'Sweets',
                    amount: '0/1',
                    bgColor: Colors.green.shade100,
                    borderColor: Colors.green,
                    titleColor: Colors.black,
                    textColor: Colors.black,
                    firstColor: selectedIndex == 2
                        ? primaryColor.withOpacity(.4)
                        : Colors.transparent,
                    secondColor: selectedIndex == 2
                        ? Colors.transparent
                        : Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: height / 8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2.0,
                              blurRadius: 2.0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Row(
                            children: [
                              Image.asset('assets/Vector.png'),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Pure Veg',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900],
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    width: 2,
                                    height: 2,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 18,
                                color: Colors.transparent,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: 30,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.5),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50))),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(.5),
                                    ),
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.red),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 2,
                                          height: 2,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Non Veg',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red[900],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisExtent: 200,
                    ),
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final data = recipes[index];
                      return CustomGridview(
                        url: data.imageUrl,
                        title: data.title,
                        boolColor: addedItems.contains(index) ? true : false,
                        onTap: () {
                          toggleItem(index);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
