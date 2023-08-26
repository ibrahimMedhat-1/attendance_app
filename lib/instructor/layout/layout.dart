import 'package:attendance_app/instructor/view_model/layout_cubit/layout_cubit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayOut extends StatelessWidget {
  const LayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.index],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: Colors.grey,
            index: cubit.index,
            animationDuration: const Duration(milliseconds: 370),
            onTap: (index) {
              cubit.changeNavBArIndex(index);
            },
            items: const [
              Icon(
                Icons.home,
              ),
              Icon(Icons.assignment),
              Icon(
                Icons.qr_code,
              ),
            ],
          ),
        );
      },
    );
  }
}
