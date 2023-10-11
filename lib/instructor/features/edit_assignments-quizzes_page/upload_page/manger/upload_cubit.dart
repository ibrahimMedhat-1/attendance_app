import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  static UploadCubit get(context) => BlocProvider.of(context);

  TextEditingController assignmentController = TextEditingController();

  void showImagePicker(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 60.0,
                            color: Colors.grey,
                          ),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () async {
                        await pickImageFromGallery();
                      },
                    )),
                  ],
                )),
          );
        });
  }

  late final String path;

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();

    await picker.pickImage(source: ImageSource.gallery).then((value) {
      path = value!.path;
      emit(ChangeImage());
    });
  }

  void uploadAssignmentDescription({
    required String courseName,
    required int assignmentIndex,
  }) {
    FirebaseFirestore.instance
        .collection("courses")
        .doc(courseName)
        .collection('assignments')
        .doc('assignment$assignmentIndex')
        .update({
      'description': assignmentController.text

    });
  }
  void addAssignment({
    required String courseName,
    required int assignmentIndex,
  })async{
    await uploadAssignmentImage(
      courseName: courseName,
      assignmentIndex: assignmentIndex
    );
    uploadAssignmentDescription(
      assignmentIndex: assignmentIndex,
      courseName: courseName

    );
  }

  Future<void> uploadAssignmentImage({
    required String courseName,
    required int assignmentIndex,
  }) async {
   await  FirebaseStorage.instance
        .ref()
        .child('assignments/assignment$assignmentIndex')
        .putFile(File(path))
        .then((value) {
      value.ref.getDownloadURL().then((value) async{
       await FirebaseFirestore.instance
            .collection('courses')
            .doc(courseName)
            .collection('assignments')
            .doc('assignment$assignmentIndex')
            .set({'pic': value});
      });
    });
  }
}
