import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/cubit/states.dart';

class WalletCubit extends Cubit<WalletStates> {
  WalletCubit() : super(WalletInitialStates());
  static WalletCubit get(context) => BlocProvider.of(context);
  bool isSelected = false;
  void sideClose() {
    isSelected = !isSelected;
    log("$isSelected");
    emit(WalletSelectedStates());
  }
}
