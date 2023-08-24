import 'package:attendance_app/instructor/view/home_page/home_page.dart';
import 'package:attendance_app/instructor/view/qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int index = 0;
  List<Widget> screens = const [
    HomePage(),
    QRCodeScanner(),
  ];
  void changeNavBArIndex(index) {
    this.index = index;
    emit(ChangeBottomNavBarIndex());
  }
}