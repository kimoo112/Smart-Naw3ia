import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naw3ia/core/routes/routes.dart';
import 'package:naw3ia/features/home/presentation/widgets/search_results.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../../../core/utils/app_assets.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;
  bool _showResults = false;

  late final Animation<Offset> _welcomeSlide, _titleSlide, _searchSlide;
  late final Animation<double> _welcomeFade,
      _imageScale,
      _imageFade,
      _titleFade,
      _searchFade;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    _searchFocusNode.addListener(_onFocusChange);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();

    _welcomeSlide =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.25, curve: Curves.easeInOut)),
    );
    _welcomeFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.25, curve: Curves.easeInOut)),
    );

    _imageScale = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.25, 0.45, curve: Curves.easeOutBack)),
    );
    _imageFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.25, 0.45, curve: Curves.easeInOut)),
    );

    _titleSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.45, 0.65, curve: Curves.easeInOut)),
    );
    _titleFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.45, 0.65, curve: Curves.easeInOut)),
    );

    _searchSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.65, 1.0, curve: Curves.easeInOut)),
    );
    _searchFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.65, 1.0, curve: Curves.easeInOut)),
    );
  }

  void _onFocusChange() {
    setState(() {
      _showResults = _searchFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String name = CacheHelper.getData(key: 'studentName') ?? '';

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!_showResults) ...[
                /// Welcome Text
                SlideTransition(
                  position: _welcomeSlide,
                  child: FadeTransition(
                    opacity: _welcomeFade,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${'app.welcome'.tr(context)}، $name",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(IconlyLight.notification),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Image
                FadeTransition(
                  opacity: _imageFade,
                  child: ScaleTransition(
                    scale: _imageScale,
                    child: Center(
                      child: Image.asset(
                        Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xFF1A1A1A)
                            ? Assets.imagesHelloHeaderDarkMode
                            : Assets.imagesHelloHeader,
                        width: 180.w,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Title
                SlideTransition(
                  position: _titleSlide,
                  child: FadeTransition(
                    opacity: _titleFade,
                    child: Text(
                      'home.how_can_we_help'.tr(context),
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              /// Search Field
              SlideTransition(
                position: _searchSlide,
                child: FadeTransition(
                  opacity: _searchFade,
                  child: Hero(
                    tag: 'search_bar',
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () => context.push(searchView),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor.withOpacity(.8),
                            border: Border.all(
                                color: Theme.of(context).dividerColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search,
                                  color: Theme.of(context).hintColor),
                              const SizedBox(width: 12),
                              Text(
                                'app.search'.tr(context),
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_showResults)
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const SearchResults(),
            ),
          ),
      ],
    );
  }
}
