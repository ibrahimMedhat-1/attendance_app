import 'package:attendance_app/instructor/features/home_page/widgets/listview_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manger/homepage_cubit/home_page_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.width * 0.1,
              centerTitle: false,
              leadingWidth: MediaQuery.of(context).size.width * 0.1,
              leading: CircleAvatar(
                backgroundImage: const AssetImage('assets/profilePic.jpeg'),
                radius: MediaQuery.of(context).size.width * 0.1,
              ),
              title: Text(
                'Welcome Eng / Ibrahim',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        itemHeight: MediaQuery.of(context).size.width * 0.1 < 48
                            ? kMinInteractiveDimension
                            : MediaQuery.of(context).size.width * 0.1,
                        value: cubit.coursesDropDownMenuValue,
                        items: cubit.courses,
                        dropdownColor: Colors.black,
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: (value) {
                          debugPrint(value);
                          cubit.changeCoursesDropDownMenuValue(value!);
                          cubit.getCourseStudents(courseName: value);
                        },
                        hint: Text(
                          'Choose your course',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      child: AnimationList(
                        studentsModel: cubit.sharedStudents,
                      ),
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
