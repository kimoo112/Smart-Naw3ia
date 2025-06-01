import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/utils/app_assets.dart';
import 'package:naw3ia/features/home/presentation/cubit/navigation_cubit.dart';
import 'package:naw3ia/features/home/presentation/widgets/floating_menu_button.dart';
import 'package:naw3ia/features/home/presentation/widgets/home_header.dart';
import 'package:naw3ia/features/home/presentation/widgets/sections/section_tabs.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _fabKey = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final currentIndex = (state as NavigationInitial).currentIndex;

        return WillPopScope(
          onWillPop: () async {
            final fabState = _fabKey.currentState;
            if (fabState?.isOpen ?? false) {
              fabState?.toggle();
              return false;
            }
            if (currentIndex != 0) {
              context.read<NavigationCubit>().changeIndex(0);
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: Stack(
              children: [
                Positioned(
                    left: 0, child: Image.asset(Assets.imagesHomeVectors)),
                Padding(
                  padding: EdgeInsets.only(top: 20.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeHeader(),
                      Expanded(
                        child: IndexedStack(
                          index: currentIndex,
                          children: const [
                            SectionTabs(),
                            Center(child: Text('Chat')),
                            Center(child: Text('Bookmarks')),
                            Center(child: Text('Profile')),
                            Center(child: Text('Settings')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingMenuButton(key: _fabKey),
            floatingActionButtonLocation: ExpandableFab.location,
          ),
        );
      },
    );
  }
}
