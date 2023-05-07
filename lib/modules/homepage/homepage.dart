import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/components/components.dart';
import 'package:wallet_app/cubit/cubit.dart';
import 'package:wallet_app/cubit/states.dart';
import 'package:wallet_app/modules/homePageWithSideBar/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletStates>(
        builder: (context, state) {
          var cubit = WalletCubit.get(context);
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("asset/images/logo.png"))),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        "eWalle",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "ubuntu",
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      if (!cubit.isSelected)
                        IconButton(
                            onPressed: () {
                              cubit.sideClose();
                              navigator(context: context, widget: SideBar());
                            },
                            icon: const Icon(
                              Icons.done_rounded,
                              size: 30,
                              color: Colors.black,
                            ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Account Overview",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      fontFamily: "avenir",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xfff1f3f6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "20,600",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Current Balance",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffffac30)),
                          child: const Icon(
                            Icons.add,
                            size: 35,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Send Money",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          fontFamily: "avenir",
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("asset/images/scanqr.png"))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffffac30)),
                          child: const Icon(
                            Icons.add,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        avatarWidget(img: "avatar1", name: "Mike"),
                        avatarWidget(img: "avatar2", name: "Joseph"),
                        avatarWidget(img: "avatar3", name: "Ashely"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          fontFamily: "avenir",
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Icon(Icons.dialpad),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 4,
                    childAspectRatio: 0.7,
                    children: [
                      serviceWidget("sendMoney", "Send\nMoney"),
                      serviceWidget("receiveMoney", "Receive\nMoney"),
                      serviceWidget("phone", "Mobile\nRecharge"),
                      serviceWidget("electricity", "Electricity\nBill"),
                      serviceWidget("tag", "Cashback\nOffer"),
                      serviceWidget("movie", "Movie\nTicket"),
                      serviceWidget("flight", "Flight\nTicket"),
                      serviceWidget("more", "More\n"),
                    ],
                  ))
                ],
              ),
            )),
          );
        },
        listener: (context, state) {});
  }
}
