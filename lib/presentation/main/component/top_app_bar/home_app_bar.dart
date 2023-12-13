import 'package:e_commerce_app/core/theme/custom/custom_app_bar.dart';
import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/presentation/main/component/top_app_bar/widgets/svg_icon_button.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cunit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/constant/app_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        duration: const Duration(milliseconds: 400),
        color: state.theme.backgroundColor,
        child: AppBar(
          leading: SvgIconButton(
              icon: AppIcons.mainLogo,
              padding: 8,
              color: state.theme.logoColor),
          title: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                    Radius.circular(CustomAppBarTheme.tabBarRadius)),
                color: state.theme.containerColor),
            child: SizedBox(
              height: 28,
              child: DefaultTabController(
                initialIndex: state.index,
                length: MallType.values.length,
                child: TabBar(
                  tabs: List.generate(
                    MallType.values.length,
                    (index) => Tab(text: MallType.values[index].toName),
                  ),
                  indicator: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(CustomAppBarTheme.tabBarRadius),
                      ),
                      color: state.theme.indicatorColor),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: state.theme.labelColor,
                  dividerColor: Colors.transparent,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                  labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                  unselectedLabelColor: state.theme.unselectedLabelColor,
                  unselectedLabelStyle:
                      Theme.of(context).textTheme.labelLarge.bold,
                  splashBorderRadius: const BorderRadius.all(
                      Radius.circular(CustomAppBarTheme.tabBarRadius)),
                  onTap: (index) =>
                      context.read<MallTypeCubit>().changeIndex(index),
                ),
              ),
            ),
          ),
          actions: [
            SvgIconButton(
                icon: AppIcons.location,
                padding: 4,
                color: state.theme.iconColor),
            SvgIconButton(
                icon: AppIcons.cart, padding: 4, color: state.theme.iconColor),
          ],
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leadingWidth: 86,
        ),
      );
    });
  }
}
