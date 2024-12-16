import 'package:flutter/material.dart';

class CustomSidebar extends StatelessWidget {
  final String url;
  final String title;
  final String amount;
  final Color bgColor;
  final Color? textColor;
  final Color? firstColor;
  final Color? secondColor;
  final Color? titleColor;
  final Color? borderColor;
  final VoidCallback onTap;

  const CustomSidebar({
    super.key,
    required this.url,
    required this.title,
    required this.amount,
    required this.bgColor,
    this.borderColor,
    this.textColor,
    this.titleColor,
    required this.onTap,
    this.firstColor,
    this.secondColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                firstColor!,
                secondColor!,
              ],
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                url,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: titleColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'LexendFont',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 48,
              height: 20,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: borderColor!)),
              child: Center(
                child: Text(
                  amount,
                  style: TextStyle(
                      fontFamily: 'LexendFont', fontSize: 12, color: textColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
