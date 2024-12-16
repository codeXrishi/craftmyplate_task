import 'package:craftmyplate/controllers/order_controller.dart';
import 'package:craftmyplate/screens/item_list.dart';
import 'package:craftmyplate/screens/order_review.dart';
import 'package:craftmyplate/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FillDetails extends StatelessWidget {
  const FillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: GestureDetector(
            onTap: () {
              Get.offAll(() => OrderReview(
                    discout: controller.guests.value > 100 ? 30.0 : 20.0,
                    total: controller.pricePerPlate.value,
                  ));
            },
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text(
                  'Order Review',
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
      ),
      backgroundColor: const Color(0xffF5F6FB),
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
                Get.offAll(() => const ItemList());
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        title: const Text(
          'Fill Details',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Iconsax.box,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'South Indian Breakfast',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'LexendFont'),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Iconsax.edit,
                  size: 15,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            Card(
              elevation: 2,
              shadowColor: Colors.black12,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: 'Occasion ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: 'LexendFont',
                                fontWeight: FontWeight.w400,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                    text: 'Birthday',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: 'LexendFont',
                                      fontWeight: FontWeight.w400,
                                    ))
                              ]),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                          weight: 1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Date and Time',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'LexendFont'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.withOpacity(.5),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  color: primaryColor,
                                ),
                                Text(
                                  '12/11/2024',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'LexendFont'),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.withOpacity(.5),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Iconsax.clock,
                                  color: primaryColor,
                                ),
                                Text(
                                  '2:00 - 4:00 pm',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'LexendFont'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price Per Plate',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'LexendFont',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Obx(() {
                              double discount =
                                  controller.guests.value > 100 ? 30.0 : 20.0;
                              return Text(
                                '$discount',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'LexendFont',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.green),
                              );
                            }),
                            const Icon(
                              Icons.arrow_downward_sharp,
                              size: 15,
                            ),
                            const Text(
                              '₹299',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'LexendFont',
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(() {
                              double price = controller.pricePerPlate.value;
                              return Text(
                                '₹ ${price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'LexendFont',
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Guest',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'LexendFont',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  int newGuests = controller.guests.value - 1;
                                  if (newGuests >= 10) {
                                    controller.updatePrice(newGuests);
                                  }
                                },
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.purple[50],
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Iconsax.minus,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 88,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.guests.value}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'LexendFont',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  int newGuests = controller.guests.value + 1;
                                  if (newGuests <= 1500) {
                                    controller.updatePrice(newGuests);
                                  }
                                },
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.purple[100],
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Slider(
                        value: controller.guests.value.toDouble(),
                        min: 10,
                        max: 1500,
                        label: '${controller.guests.value}',
                        onChanged: (value) {
                          controller.updatePrice(value.toInt());
                        },
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('10(min)'), Text('1500')],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text.rich(
                      TextSpan(
                          text: '✨DYNAMIC PRICING ',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'LexendFont',
                              color: primaryColor),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'more quest, more savings',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'LexendFont',
                                  color: Colors.black),
                            )
                          ]),
                    )
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
