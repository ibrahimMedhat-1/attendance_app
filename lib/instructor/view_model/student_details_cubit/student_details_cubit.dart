import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'student_details_state.dart';

class StudentDetailsCubit extends Cubit<StudentDetailsState> {
  StudentDetailsCubit() : super(StudentDetailsInitial());

  static StudentDetailsCubit get(context) => BlocProvider.of(context);

  void launch({required String url}) async {
    final link = Uri.parse(url);
    if (await canLaunchUrl(link)) {
      await launchUrl(link, mode: LaunchMode.externalApplication);
    }
  }
}
