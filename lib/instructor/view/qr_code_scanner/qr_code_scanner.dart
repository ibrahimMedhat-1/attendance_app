import 'package:attendance_app/instructor/view_model/qr_code_cubit/qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatelessWidget {
  const QRCodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCubit(),
      child: BlocConsumer<QrCubit, QrState>(
        listener: (context, state) {},
        builder: (context, state) {
          QrCubit cubit = QrCubit.get(context);
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                QRView(
                  key: cubit.qrKey,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.amber,
                    borderRadius: 10,
                    borderLength: 20,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
                  ),
                  onQRViewCreated: (qrViewController) {
                    cubit.qrValue(qrViewController);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
