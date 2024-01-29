import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

// ignore: must_be_immutable
class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
