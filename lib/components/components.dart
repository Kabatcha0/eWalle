import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigator({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigatorReplacement(
    {required BuildContext context, required Widget widget}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

Widget avatarWidget({
  required String img,
  required String name,
}) {
  return Container(
    margin: const EdgeInsets.all(10),
    height: 150,
    width: 120,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xfff1f3f6)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("asset/images/$img.png"),
                  fit: BoxFit.contain),
              border: Border.all(color: Colors.black, width: 1.4)),
        ),
        Text(
          name,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: "avenir",
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

Widget serviceWidget(
  String img,
  String name,
) {
  return Column(
    children: [
      Expanded(
          child: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xfff1f3f6)),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/images/$img.png"))),
            ),
          ),
        ),
      )),
      const SizedBox(
        height: 8,
      ),
      Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: "avenir",
        ),
      ),
    ],
  );
}
