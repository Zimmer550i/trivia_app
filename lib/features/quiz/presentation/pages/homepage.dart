import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/features/quiz/presentation/provider/status.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/difficulty_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
        leading: const Icon(Icons.menu_rounded),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(3 * DEFAULT_PADDING, DEFAULT_PADDING),
          bottomRight: Radius.elliptical(3 * DEFAULT_PADDING, DEFAULT_PADDING),
        )),
        toolbarHeight: 100,
        actions: [
          const Center(
            child: Icon(Icons.account_circle_rounded),
          ),
          SizedBox(
            width: DEFAULT_PADDING,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: DEFAULT_PADDING,
          left: DEFAULT_PADDING,
          top: DEFAULT_PADDING * 2,
        ),
        child: Column(
          children: [
            const DifficultyButton(),
            SizedBox(
              height: DEFAULT_PADDING,
            ),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: BASE_WIDGET_HEIGHT + DEFAULT_PADDING/3,
                diameterRatio: 5,
                children:
                    CATEGORIES.map((map) => topicNames(context, map)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topicNames(BuildContext context, Map<String, String> item) {
    bool isSelected = context.watch<Status>().category == item['id'];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: DEFAULT_PADDING/6),
      child: InkWell(
        onTap: () {
          context.read<Status>().changeCategory(item['id']!);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: BASE_WIDGET_HEIGHT,
          decoration: BoxDecoration(
            color: isSelected ? PRIMARY_COLOR : SECONDARY_COLOR,
            borderRadius: BorderRadius.circular(DEFAULT_PADDING),
            boxShadow: [AppTheme.boxShadow],
          ),
          child: Center(child: Text(item['name']!)),
        ),
      ),
    );
  }
}
