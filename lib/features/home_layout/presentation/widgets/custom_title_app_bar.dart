import 'package:flutter/material.dart'
;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_layout_cubit.dart';
import 'custom_app_bar_title.dart';
class CustomLayoutTitleAppBar extends StatelessWidget {
  const CustomLayoutTitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        HomeLayoutCubit homeLayoutCubit = context.read<HomeLayoutCubit>();
        return CustomTitleAppBar(
              title: homeLayoutCubit.titles[homeLayoutCubit.currentIndex],
            );
      },
    );
  }
}

