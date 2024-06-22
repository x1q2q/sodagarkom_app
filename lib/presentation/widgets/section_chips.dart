import 'package:flutter/material.dart';
import '../../core/colors.dart';
import 'package:get/get.dart';

class SectionChips extends StatelessWidget {
  final controller;
  const SectionChips({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.chips.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() => Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: ChoiceChip(
                    color: MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.selected)
                          ? AppColors.redv2
                          : Colors.white;
                    }),
                    showCheckmark: false,
                    label: Text(
                      '${controller.chips[index]}',
                    ),
                    labelStyle: TextStyle(
                        fontFamily: 'PlusJakarta',
                        fontWeight: FontWeight.w500,
                        color: (controller.idChipSelected.value == index)
                            ? Colors.white
                            : Colors.black,
                        fontSize: 15),
                    selected: controller.idChipSelected.value == index,
                    onSelected: (bool selected) {
                      if (controller.idChipSelected.value != index) {
                        // prevent for double click on the same chip
                        controller.changeChip(selected, index);
                      }
                    },
                  )));
            }));
  }
}
