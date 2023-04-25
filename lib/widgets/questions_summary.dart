import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (summary) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            summary['user_answer'] == summary['correct_answer']
                                ? const Color.fromARGB(255, 64, 182, 104)
                                : const Color.fromARGB(255, 245, 49, 157),
                      ),
                      child: Text(
                        ((summary['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            summary['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            summary['user_answer'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 245, 49, 157),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(summary['correct_answer'] as String,
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 64, 182, 104),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
