import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:goodhabits/core/styles/colors.dart';
import 'package:goodhabits/core/styles/typography.dart';
import 'package:goodhabits/features/home/presenters/controllers/home_controller.store.dart';
import 'package:goodhabits/features/home/presenters/pages/widgets/run_habit_component.dart';
import 'package:goodhabits/features/home/presenters/pages/widgets/water_habit_page.dart';
import 'package:goodhabits/features/home/presenters/utils/ui_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray500,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Boa Tarde,',
                        style: AppTypography.heading1().copyWith(fontSize: 22),
                      ),
                      Text(
                        'Iago010,',
                        style: AppTypography.heading2().copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Observer(
                builder: (context) {
                  return switch (controller.currentState.runtimeType) {
                    WaterHabitState => WaterHabitComponent(),
                    RunHabitState => RunHabitComponent(),
                    Other2HabitState => RunHabitComponent(),
                    _ => const Text(""),
                  };
                },
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (context) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Meta diária",
                            style: TextStyle(
                              color: controller.currentHabit.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${controller.currentHabit.goalValue.ceil()} ${controller.currentHabit.measurements}",
                            style: const TextStyle(
                              color: Color(0xff4E4964),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Slider.adaptive(
                          activeColor: controller.currentHabit.primaryColor,
                          thumbColor: controller.currentHabit.primaryColor,
                          inactiveColor: AppColors.gray200,
                          value: controller.currentHabit.goalValue,
                          divisions: controller.currentHabit.divisors,
                          onChanged: (value) {
                            controller.currentHabit.changeGoalValue(value);
                            setState(() {});
                          },
                          max: controller.currentHabit.goalMaxValue,
                          min: controller.currentHabit.goalMinValue,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Observer(
                builder: (context) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.currentHabit.action,
                            style: TextStyle(
                              color: controller.currentHabit.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${controller.auxValueHabit.ceil()} ${controller.currentHabit.measurements}",
                            style: const TextStyle(
                              color: Color(0xff4E4964),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Observer(
                          builder: (context) {
                            return Slider.adaptive(
                              activeColor: controller.currentHabit.primaryColor,
                              thumbColor: controller.currentHabit.primaryColor,
                              inactiveColor: AppColors.gray200,
                              value: controller.auxValueHabit,
                              max: controller.currentHabit.goalMaxValue,
                              min: controller.currentHabit.goalMinValue,
                              divisions: controller.currentHabit.divisors,
                              onChanged: (value) {
                                if (value >=
                                    controller.currentHabit.goalMinValue) {
                                  controller.changeHabitValue(value);
                                  setState(() {});
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (context) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: controller.currentHabit.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.currentHabit
                            .changeValue(controller.auxValueHabit);
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 4,
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      child: Text(
                        "Adicionar",
                        style: AppTypography.title(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Observer(
      //   builder: (context) {
      //     return AnimatedContainer(
      //       duration: const Duration(milliseconds: 500),
      //       decoration: BoxDecoration(
      //         color: controller.currentHabit.primaryColor,
      //         shape: BoxShape.rectangle,
      //         borderRadius: const BorderRadius.all(
      //           Radius.circular(16),
      //         ),
      //       ),
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           controller.currentHabit.changeValue(controller.auxValueHabit);
      //           setState(() {});
      //         },
      //         backgroundColor: Colors.transparent,
      //         elevation: 0,
      //         child: const Icon(
      //           Icons.add,
      //           color: Colors.black,
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
