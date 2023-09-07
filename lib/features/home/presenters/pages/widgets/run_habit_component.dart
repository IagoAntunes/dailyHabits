import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../controllers/home_controller.store.dart';

class RunHabitComponent extends StatelessWidget {
  RunHabitComponent({
    super.key,
    this.isDragabble = false,
  });

  final HomeController controller = Modular.get<HomeController>();
  final bool isDragabble;
  @override
  Widget build(BuildContext context) {
    return Draggable(
      onDragEnd: (details) {
        controller.changeHabit(details.offset.dx < 0 ? false : true);
      },
      childWhenDragging: Container(
        height: 350,
      ),
      axis: Axis.horizontal,
      feedback: Material(
        color: AppColors.gray500,
        child: RunHabitComponent(
          isDragabble: true,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            width: MediaQuery.sizeOf(context).width * 0.7,
            height: 350,
            decoration: BoxDecoration(
              color: controller.currentHabit!.primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${((controller.currentHabit!.habitValue * 100) / controller.currentHabit!.goalValue) > 0 ? ((controller.currentHabit!.habitValue * 100) / controller.currentHabit!.goalValue).ceil() : 0}%",
                  style: AppTypography.card(),
                ),
                const Center(
                  child: Text(
                    "🏃🏻",
                    style: TextStyle(fontSize: 90),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          controller.currentHabit!.description,
                          style: AppTypography.card(),
                        ),
                        Text(
                          "Meta: ${controller.currentHabit!.goalValue.ceil()} ${controller.currentHabit!.measurements}",
                          style: AppTypography.title(color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Atual',
                          style: AppTypography.card(),
                        ),
                        Text(
                          "${controller.currentHabit!.habitValue} ${controller.currentHabit!.measurements}",
                          style: AppTypography.title(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
