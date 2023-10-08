import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());
  static QrCubit get(context) => BlocProvider.of(context);
  final qrKey = GlobalKey(debugLabel: 'qrKey');
  QRViewController? qrViewController;
  String? barCodeIs;
  void qrValue(QRViewController qrViewController) {
    this.qrViewController = qrViewController;
    this.qrViewController!.scannedDataStream.listen((event) {
      barCodeIs = event.code.toString();
      emit(ChangeQrViewControllerValue());
    });
  }
}
