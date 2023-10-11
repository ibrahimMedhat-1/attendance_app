part of 'upload_cubit.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}
class ChangeImage extends UploadState {}
