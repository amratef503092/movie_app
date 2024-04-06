

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_layout_cubit.dart';

class CustomBodyLayout extends StatelessWidget {
  const CustomBodyLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        var homeLayoutCubit = context.read<HomeLayoutCubit>();
        return homeLayoutCubit.pages[homeLayoutCubit.currentIndex];
      },
    );
  }
}

