part of 'qr_cubit.dart';

@immutable
abstract class QrState {}

class QrInitial extends QrState {}

class ChangeQrViewControllerValue extends QrState {}
