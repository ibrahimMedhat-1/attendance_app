import 'package:attendance_app/instructor/features/edit_assignments-quizzes_page/upload_page/manger/upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadPage extends StatelessWidget {
  final String courseNameUploadTo;
  final int assignmentIndex;

  const UploadPage({
    Key? key,
    required this.courseNameUploadTo,
    required this.assignmentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadCubit(),
      child: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {},
        builder: (context, state) {
          UploadCubit cubit = UploadCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Upload Assignment",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        cubit.showImagePicker(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Image.asset('assets/icons8-add-photo-80.png')),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: cubit.productNameController,
                      decoration: const InputDecoration(
                          hintText: "Product Name",
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(borderSide: BorderSide())),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    flex: 3,
                    child: TextFormField(
                      maxLines: 6,
                      controller: cubit.productDescribtionController,
                      decoration: const InputDecoration(
                          hintText: "Description..",
                          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(borderSide: BorderSide())),
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Theme.of(context).colorScheme.secondaryContainer)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                            child: Text('Cancel', style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Theme.of(context).colorScheme.secondaryContainer)),
                          onPressed: () {
                            cubit.showImagePicker(
                              context,
                              courseName: courseNameUploadTo,
                              assignmentIndex: assignmentIndex,
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                            child: Text(
                              'Add',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
