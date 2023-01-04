import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      required this.isInverted});

  final blackColor = const Color(0xFF1F2123);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : blackColor,
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 38,
                  color: isInverted ? blackColor : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      color: isInverted ? blackColor : Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    code,
                    style: TextStyle(
                      color: isInverted
                          ? blackColor
                          : Colors.white.withOpacity(0.7),
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ]),
            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                offset: const Offset(-5, 15),
                child: Icon(
                  icon,
                  color: isInverted ? blackColor : Colors.white,
                  size: 89,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
