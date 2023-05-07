import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/components/components.dart';
import 'package:wallet_app/cubit/cubit.dart';
import 'package:wallet_app/cubit/states.dart';
import 'package:wallet_app/modules/homepage/homepage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletStates>(
        builder: (context, state) {
          var cubit = WalletCubit.get(context);
          return Scaffold(
              body: SafeArea(
                  child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    "asset/images/sideImg.png",
                  ),
                  fit: BoxFit.cover,
                )),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "6:22 AM",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "avenir",
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("asset/images/cloud.png"))),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          "24 C",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "avenir",
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const Text(
                      "Aug 1, 2023 | Wednesday",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            "asset/images/logo.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const Text(
                          "eWalle",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontFamily: "ubuntu",
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Open An Account For \nDigital E-Wallet Solutions. \nInstant Payouts.\n\nJoin For Free",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )),
                    InkWell(
                      onTap: () {
                        navigator(context: context, widget: const HomePage());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color(0xffffac30),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "ubuntu",
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 19,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "Create an account",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          )));
        },
        listener: (context, state) {});
  }
}
