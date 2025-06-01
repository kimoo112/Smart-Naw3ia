import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/features/home/presentation/views/department_details_page.dart';

import '../../data/models/department_model.dart';

class DepartmentListViewWidget extends StatelessWidget {
  final List<DepartmentModel> departmentList;

  const DepartmentListViewWidget({
    Key? key,
    required this.departmentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final textTheme = Theme.of(context).textTheme;

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      itemCount: departmentList.length,
      itemBuilder: (context, index) {
        final dept = departmentList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DepartmentDetailsPage(department: dept),
              ),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.12),
                  Theme.of(context).cardColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 48.w,
                        width: 48.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6)
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Center(
                          child: Icon(
                                           dept.icon,
            
                            size: 24.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: Text(
                          dept.getName(locale),
                          style: textTheme.titleMedium?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    dept.getDescription(locale),
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 13.5.sp,
                      height: 1.4,
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.color
                          ?.withOpacity(0.7),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.people_alt_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 18.sp),
                          SizedBox(width: 6.w),
                          Text(
                            '${dept.facultyMembers.length + 1} ${locale == 'ar' ? 'عضو هيئة تدريس' : 'Faculty Members'}',
                            style: textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                        
                      ),
                      Text(
                            'settings.more'.tr(context),
                            style: textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
