import 'package:carpool/logic/theme_logic.dart';
import 'package:carpool/theme/app_style.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_colors.dart';

class CarpoolBottomBar extends StatefulWidget {
  final bool isDarkMode;

  const CarpoolBottomBar({super.key, required this.isDarkMode});

  @override
  _CarpoolBottomBarState createState() => _CarpoolBottomBarState();
}

class _CarpoolBottomBarState extends State<CarpoolBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.passthrough,
      children: [
        Container(
          color:
              widget.isDarkMode ? AppColors.ninthColor : AppColors.thirdColor,
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: Column(
                  children: [
                    Icon(
                      Icons.search,
                      color: _selectedIndex == 0
                          ? (widget.isDarkMode
                              ? Colors.white
                              : AppColors.textColor)
                          : (widget.isDarkMode
                              ? AppColors.firstColor
                              : AppColors.fifthColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      StringsManager.instance
                          .getString(context, home_page_search_label),
                      style: TextStyle(
                        color: _selectedIndex == 0
                            ? (widget.isDarkMode
                                ? Colors.white
                                : AppColors.textColor)
                            : (widget.isDarkMode
                                ? AppColors.firstColor
                                : AppColors.fifthColor),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(
                    () {
                      _selectedIndex = 0;
                    },
                  );
                },
              ),
              TextButton(
                child: Column(
                  children: [
                    Icon(
                      Icons.add,
                      color: _selectedIndex == 1
                          ? (widget.isDarkMode
                              ? Colors.white
                              : AppColors.textColor)
                          : (widget.isDarkMode
                              ? AppColors.firstColor
                              : AppColors.fifthColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      StringsManager.instance
                          .getString(context, home_page_publish_label),
                      style: TextStyle(
                        color: _selectedIndex == 0
                            ? (widget.isDarkMode
                                ? Colors.white
                                : AppColors.textColor)
                            : (widget.isDarkMode
                                ? AppColors.firstColor
                                : AppColors.fifthColor),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(
                    () {
                      _selectedIndex = 1;
                    },
                  );
                },
              ),
              TextButton(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Icon(
                          Icons.message,
                          color: _selectedIndex == 2
                              ? (widget.isDarkMode
                                  ? Colors.white
                                  : AppColors.textColor)
                              : (widget.isDarkMode
                                  ? AppColors.firstColor
                                  : AppColors.fifthColor),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:
                                  Colors.red, // Customize badge color as needed
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "10", // Replace with actual unread message count
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      StringsManager.instance
                          .getString(context, home_page_messages_label),
                      style: TextStyle(
                        color: _selectedIndex == 0
                            ? (widget.isDarkMode
                                ? Colors.white
                                : AppColors.textColor)
                            : (widget.isDarkMode
                                ? AppColors.firstColor
                                : AppColors.fifthColor),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(
                    () {
                      _selectedIndex = 2;
                    },
                  );
                },
              ),
              TextButton(
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: _selectedIndex == 3
                          ? (widget.isDarkMode
                              ? Colors.white
                              : AppColors.textColor)
                          : (widget.isDarkMode
                              ? AppColors.firstColor
                              : AppColors.fifthColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                        StringsManager.instance
                            .getString(context, home_page_schedule_label),
                        style: TextStyle(
                          color: _selectedIndex == 0
                              ? (widget.isDarkMode
                                  ? Colors.white
                                  : AppColors.textColor)
                              : (widget.isDarkMode
                                  ? AppColors.firstColor
                                  : AppColors.fifthColor),
                        )),
                  ],
                ),
                onPressed: () {
                  setState(
                    () {
                      _selectedIndex = 3;
                    },
                  );
                },
              ),
              TextButton(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.eco,
                      color: _selectedIndex == 4
                          ? (widget.isDarkMode
                              ? Colors.white
                              : AppColors.textColor)
                          : (widget.isDarkMode
                              ? AppColors.firstColor
                              : AppColors.fifthColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      StringsManager.instance
                          .getString(context, home_page_metrics_label),
                      style: TextStyle(
                        color: _selectedIndex == 0
                            ? (widget.isDarkMode
                                ? Colors.white
                                : AppColors.textColor)
                            : (widget.isDarkMode
                                ? AppColors.firstColor
                                : AppColors.fifthColor),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(
                    () {
                      _selectedIndex = 4;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
