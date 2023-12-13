import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cunit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/bottom_nav_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar(this.bottomNav, {super.key});

  final BottomNav bottomNav;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        color: state.isMarket
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary,
        child: AppBar(
          title: Text(
            bottomNav.toName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: state.isMarket? Theme.of(context).colorScheme.background :  Theme.of(context).colorScheme.contentPrimary),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
      );
    });
  }
}
