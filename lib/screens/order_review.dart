import 'package:craftmyplate/screens/fill_details.dart';
import 'package:craftmyplate/utils/constant.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderReview extends StatelessWidget {
  final double total;
  final double discout;

  const OrderReview({super.key, required this.total, required this.discout});

  @override
  Widget build(BuildContext context) {
    int toPay = total.toInt();
    int discountPay = discout.toInt();
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'To Pay',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'LexendFont'),
                      ),
                      Text(
                        '$toPay',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'LexendFont'),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.9),
                      borderRadius: BorderRadius.circular(12)),
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
                Get.offAll(() => const FillDetails());
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
          'Order Review',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF5F6FB),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _cardOne(),
            const SizedBox(
              height: 15.0,
            ),
            Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff9765ca),
                          Color(0xff7d3ebc),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Center(
                      child: Text.rich(
                        TextSpan(
                            text: '🥳 Hurray! You Saved ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: 'LexendFont',
                              fontWeight: FontWeight.w400,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: '₹ 17,300 /- ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'LexendFont',
                                    color: Color(0xffEFB31A),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'on total order',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontFamily: 'LexendFont',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ]),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'LexendFont',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              '$toPay',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'LexendFont',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Dynamic pricing discount ✨',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'LexendFont',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              '$discountPay' '%',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: 'LexendFont',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const DottedLine(
                          dashColor: Colors.grey,
                          lineThickness: 1,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'To Pay',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'LexendFont',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '$toPay',
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'LexendFont',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardOne() {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Iconsax.box,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Millet Breakfast',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'LexendFont'),
                        ),
                      ],
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffED4596),
                          fontFamily: 'LexendFont'),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '265',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'LexendFont',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.calendar_today,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '11/09/2024',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'LexendFont',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Iconsax.clock,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '12:30 AM - 02:30',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'LexendFont',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.grey[50],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hide selected items',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'LexendFont',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_up,
                  size: 18,
                  color: Colors.grey,
                )
              ],
            ),
            Divider(
              color: Colors.grey[200],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: 'Subtotal ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'LexendFont',
                            fontWeight: FontWeight.w400,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                                text: '₹ 24600 ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'LexendFont',
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '₹22,200 ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'LexendFont',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                          ]),
                    ),
                    Text(
                      'Incl.taxes and charges',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontFamily: 'LexendFont',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
