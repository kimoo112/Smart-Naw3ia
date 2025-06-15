import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/models/lecture_model.dart';

class LectureCard extends StatelessWidget {
  final Lecture lecture;

  const LectureCard({
    super.key,
    required this.lecture,
  });

  @override
  Widget build(BuildContext context) {
    Color typeColor;
    IconData typeIcon;

    switch (lecture.type) {
      case LectureType.lecture:
        typeColor = Colors.blue;
        typeIcon = FontAwesomeIcons.bookOpenReader;
        break;
      case LectureType.lab:
        typeColor = Colors.green;
        typeIcon = FontAwesomeIcons.flask;
        break;
      case LectureType.tutorial:
        typeColor = Colors.orange;
        typeIcon = FontAwesomeIcons.userGraduate;
        break;
      case LectureType.workshop:
        typeColor = Colors.purple;
        typeIcon = FontAwesomeIcons.screwdriverWrench;
        break;
      case LectureType.other:
        typeColor = Colors.grey;
        typeIcon = FontAwesomeIcons.school;
        break;
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: typeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: typeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        typeIcon,
                        size: 14,
                        color: typeColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _getLectureTypeText(lecture.type),
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: typeColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.clock,
                        size: 12,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        lecture.formatTimeRange(),
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              lecture.subjectName,
              style: const TextStyle(
                fontFamily: "Almarai",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.userTie,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 6),
                Text(
                  lecture.instructorName,
                  style: TextStyle(
                    fontFamily: "Almarai",
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.locationDot,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 6),
                Text(
                  lecture.location,
                  style: TextStyle(
                    fontFamily: "Almarai",
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            if (lecture.notes != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.amber.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.circleInfo,
                      size: 14,
                      color: Colors.amber[700],
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        lecture.notes!,
                        style: TextStyle(
                          fontFamily: "Almarai",
                          fontSize: 12,
                          color: Colors.amber[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getLectureTypeText(LectureType type) {
    switch (type) {
      case LectureType.lecture:
        return 'محاضرة';
      case LectureType.lab:
        return 'معمل';
      case LectureType.tutorial:
        return 'تمارين';
      case LectureType.workshop:
        return 'ورشة عمل';
      case LectureType.other:
        return 'أخرى';
    }
  }
}
