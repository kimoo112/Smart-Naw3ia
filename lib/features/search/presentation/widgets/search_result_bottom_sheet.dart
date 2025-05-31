import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/features/home/data/models/department_model.dart';
import 'package:naw3ia/features/home/data/models/news_model.dart';
import 'package:naw3ia/features/home/data/models/staff_model.dart';
import 'package:naw3ia/features/search/model/search_result_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultBottomSheet extends StatelessWidget {
  final SearchResult result;
  final String locale;

  const SearchResultBottomSheet({
    super.key,
    required this.result,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          // Content
          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(24.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with icon and title
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          child: Icon(
                            _getIconForType(result.type),
                            color: Theme.of(context).primaryColor,
                            size: 32.sp,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Text(
                            result.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    // Content based on type
                    _buildContent(context),
                    SizedBox(height: 24.h),
                    // Action buttons
                    _buildActions(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (result.type) {
      case SearchResultType.department:
        final department = result.originalItem as DepartmentModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              department.getDescription(locale),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color
                        ?.withOpacity(0.8),
                  ),
            ),
            SizedBox(height: 16.h),
            _buildInfoRow(context, 'staff.department_count'.tr(context),
                '${department.facultyMembers.length} ${"staff.members".tr(context)}'),
            _buildInfoRow(context, 'staff.department_head'.tr(context),
                " ${department.head.getTitle(locale)} / ${department.head.getName(locale)}"),
          ],
        );

      case SearchResultType.staff:
        final staff = result.originalItem as StaffMember;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (staff.position != null)
              _buildInfoRow(context, 'Position:', staff.position!),
            if (staff.specialization != null)
              _buildInfoRow(context, 'Specialization:', staff.specialization!),
            if (staff.email != null)
              _buildInfoRow(context, 'Email:', staff.email!),
          ],
        );

      case SearchResultType.news:
        final news = result.originalItem as NewsModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.getDescription(locale) != null)
              Text(
                news.getDescription(locale)!,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.5,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.color
                          ?.withOpacity(0.8),
                    ),
              ),
            SizedBox(height: 16.h),
            _buildInfoRow(context, 'Date:', news.date),
          ],
        );

      default:
        return Text(
          result.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.5,
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.color
                    ?.withOpacity(0.8),
              ),
        );
    }
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.color
                      ?.withOpacity(0.7),
                ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //       
      ],
    );
  }

  void _handleViewMore(BuildContext context) {
    switch (result.type) {
      case SearchResultType.department:
        final department = result.originalItem as DepartmentModel;
        context.push('/department-details', extra: department);
        break;
      case SearchResultType.news:
        final news = result.originalItem as NewsModel;
        if (news.link != null) {
          launchUrl(Uri.parse(news.link!));
        }
        break;
      case SearchResultType.staff:
        // Navigate to staff details page if available
        break;
      default:
        break;
    }
  }

  IconData _getIconForType(SearchResultType type) {
    switch (type) {
      case SearchResultType.department:
        return Icons.apartment_rounded;
      case SearchResultType.news:
        return Icons.article_outlined;
      case SearchResultType.staff:
        return Icons.person_outline_rounded;
      case SearchResultType.facultyInfo:
        return Icons.school_outlined;
      case SearchResultType.chatDepartment:
        return Icons.chat_bubble_outline_rounded;
    }
  }
}
