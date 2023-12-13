import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/presentation/main/component/top_app_bar/top_app_bar.dart';
import 'package:e_commerce_app/presentation/main/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cunit.dart';
import 'package:e_commerce_app/presentation/pages/category/category_page.dart';
import 'package:e_commerce_app/presentation/pages/hom/home_page.dart';
import 'package:e_commerce_app/presentation/pages/search/search_page.dart';
import 'package:e_commerce_app/presentation/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => MallTypeCubit()),
      ],
      child: const MainScreenView(),
    );

    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: const MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          switch (state) {
            case BottomNav.home:
              return const HomePage();
            case BottomNav.category:
              return const CategoryPage();
            case BottomNav.search:
              return const SearchPage();
            case BottomNav.user:
              return const UserPage();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          return BottomNavigationBar(
            items: List.generate(
              BottomNav.values.length,
              (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(BottomNav.values[index].icon),
                label: BottomNav.values[index].toName,
                activeIcon: SvgPicture.asset(
                  (BottomNav.values[index].activeIcon),
                ),
              ),
            ),
            onTap: (index) => context.read<BottomNavCubit>().changeIndex(index),
            //사용자가 현재 어떤 항목을 선택했는지 추적하고 해당 인덱스에 해당하는 페이지나 화면을 표시하는 데 사용
            currentIndex: state.index,
            //고정된(일정한 크기의) 탭을 표시하는 데 사용
            type: BottomNavigationBarType.fixed,
            //선택되지 않은 탭의 라벨을 표시할지 여부를 결정
            showSelectedLabels: false,
            //택된 탭의 라벨을 표시할지 여부를 결정
            showUnselectedLabels: false,
          );
        },
      ),
    );
  }
}
