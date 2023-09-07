import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../controllers/home_controller.store.dart';

class WaterHabitComponent extends StatelessWidget {
  WaterHabitComponent({
    super.key,
    this.isDragabble = false,
  });

  final HomeController controller = Modular.get<HomeController>();
  final bool isDragabble;

  static const _colors = [
    Color(0xFF00BBF9),
  ];

  static const _durations = [
    5000,
  ];

  static const _heightPercentages = [
    0.5,
  ];

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
        child: WaterHabitComponent(
          isDragabble: true,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.7,
              height: 350,
              decoration: const BoxDecoration(
                color: AppColors.blue,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      child: WaveWidget(
                        heightPercentage: 1,
                        config: CustomConfig(
                          colors: _colors,
                          durations: _durations,
                          heightPercentages: _heightPercentages,
                        ),
                        size: const Size(double.infinity, double.infinity),
                      ),
                    ),
                  ),
                  // goal -- 100
                  // value -- x
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${((controller.currentHabit!.habitValue * 100) / controller.currentHabit!.goalValue) > 0 ? ((controller.currentHabit!.habitValue * 100) / controller.currentHabit!.goalValue).ceil() : 0}%",
                        style: AppTypography.card(),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "💧",
                      style: TextStyle(fontSize: 90),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                controller.currentHabit!.description,
                                style: AppTypography.card(),
                              ),
                              Text(
                                "Meta: ${(controller.currentHabit!.goalValue / 1000).ceil()} L",
                                style: AppTypography.title(color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Atual',
                                style: AppTypography.card(),
                              ),
                              Text(
                                " ${controller.currentHabit!.habitValue.ceil()} L",
                                style: AppTypography.title(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
