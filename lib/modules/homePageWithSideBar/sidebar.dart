import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/cubit/cubit.dart';
import 'package:wallet_app/cubit/states.dart';
import 'package:wallet_app/modules/homepage/homepage.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin {
  AnimationController? animatedContainer;
  @override
  void initState() {
    animatedContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WalletCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: const BoxDecoration(
                    color: Color(0xfff1f3f6),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(60))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("asset/images/avatar4.png"))),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Carol Johanson",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Seattle Washington",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              cubit.sideClose();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 25,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  navigatorTitle("Home", true),
                  navigatorTitle("Profile", false),
                  navigatorTitle("Accounts", false),
                  navigatorTitle("Transactions", false),
                  navigatorTitle("Stats", false),
                  navigatorTitle("Settings", false),
                  navigatorTitle("Help", false),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.power_settings_new_rounded,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsetsDirectional.only(
                        start: 10, bottom: 8, end: 8, top: 8),
                    child: const Text(
                      "Ver 2.0.1",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              )),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: cubit.isSelected
                    ? MediaQuery.of(context).size.width * .6
                    : 0,
                top: cubit.isSelected
                    ? MediaQuery.of(context).size.height * 0.1
                    : 0,
                child: RotationTransition(
                  turns: cubit.isSelected
                      ? Tween<double>(begin: -0.05, end: 0)
                          .animate(animatedContainer!)
                      : Tween<double>(begin: 0.0, end: -0.05)
                          .animate(animatedContainer!),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: cubit.isSelected
                        ? MediaQuery.of(context).size.height * 0.93
                        : MediaQuery.of(context).size.height,
                    width: cubit.isSelected
                        ? MediaQuery.of(context).size.width * 0.6
                        : MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color(0xfff1f3f6),
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(40)
                                // bottomEnd: Radius.circular(40),
                                // bottomStart: Radius.circular(40),
                                )),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: HomePage(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget navigatorTitle(String name, bool isSelected) {
    return Row(
      children: [
        (isSelected)
            ? Container(
                width: 5,
                height: 60,
                color: const Color(0xffffac30),
              )
            : const SizedBox(
                width: 5,
                height: 60,
              ),
        const SizedBox(
          width: 10,
          height: 60,
        ),
        Text(
          name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w400),
        )
      ],
    );
  }
}
