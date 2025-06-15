import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../../../core/routes/routes.dart';
import '../../../chat/data/models/department_model.dart' as chat;
import '../../../chat/data/models/faculty_info_model.dart';
import '../../../home/data/models/department_model.dart';
import '../../../home/data/models/news_model.dart';
import '../../../home/data/models/staff_model.dart';
import '../../model/search_result_model.dart';
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
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          Text(
            result.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 16.h),
          _buildResultDetails(context),
          SizedBox(height: 16.h),
          _buildViewMoreButton(context),
        ],
      ),
    );
  }

  Widget _buildResultDetails(BuildContext context) {
    switch (result.type) {
      case SearchResultType.department:
        final department = result.originalItem as DepartmentModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(context, 'department_details.about'.tr(context),
                department.getDescription(locale)),
            _buildInfoRow(context, 'staff.department_head'.tr(context),
                department.head.getName(locale)),
          ],
        );
      case SearchResultType.chatDepartment:
        final department = result.originalItem as chat.DepartmentModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(context, 'department_details.about'.tr(context),
                department.getDescription(locale)),
            _buildInfoRow(context, 'staff.department_head'.tr(context),
                department.getHead(locale)),
          ],
        );
      case SearchResultType.staff:
        final staff = result.originalItem as StaffMember;

        final staffDepartment = departments.firstWhere(
          (dept) => dept.facultyMembers.contains(staff) || dept.head == staff,
          orElse: () => departments.first,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(context, 'staff.department'.tr(context),
                staffDepartment.getName(locale)),
            if (staff.position != null)
              _buildInfoRow(
                  context, 'staff.position'.tr(context), staff.position!),
            if (staff.getSpecialization(locale) != null)
              _buildInfoRow(context, 'staff.specialization'.tr(context),
                  staff.getSpecialization(locale)!),
            if (staff.email != null)
              _buildInfoRow(context, 'staff.email'.tr(context), staff.email!),
          ],
        );
      case SearchResultType.news:
        final news = result.originalItem as NewsModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(context, 'news.date'.tr(context), news.date),
            if (news.getDescription(locale) != null)
              _buildInfoRow(context, 'news.description'.tr(context),
                  news.getDescription(locale)!),
          ],
        );
      case SearchResultType.facultyInfo:
        final info = result.originalItem as FacultyInfoModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(
                context,
                'search.faculty_info_description'.tr(context),
                info.getDescription(locale)),
          ],
        );
    }
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildViewMoreButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _handleViewMore(context),
        child: Text('search.more'.tr(context)),
      ),
    );
  }

  void _handleViewMore(BuildContext context) {
    switch (result.type) {
      case SearchResultType.department:
        final department = result.originalItem as DepartmentModel;
        context.push(departmentDetailsView, extra: department);
        break;
      case SearchResultType.chatDepartment:
        // Chat department results don't navigate to details
        break;
      case SearchResultType.news:
        final news = result.originalItem as NewsModel;
        if (news.link != null) {
          launchUrl(Uri.parse(news.link!));
        }
        break;
      case SearchResultType.staff:
        final staff = result.originalItem as StaffMember;
        // Find the department by checking if the staff member is in faculty members or is head
        final staffDepartment = departments.firstWhere(
          (dept) => dept.facultyMembers.contains(staff) || dept.head == staff,
          orElse: () =>
              departments.first, // Fallback to first department if not found
        );
        // Navigate to department details with initial tab index 4 (staff tab)
        context.push(departmentDetailsView, extra: {
          'department': staffDepartment,
          'initialTabIndex': 4,
        });
        break;
      case SearchResultType.facultyInfo:
        // Faculty info navigation could be added here
        break;
    }
  }
}
