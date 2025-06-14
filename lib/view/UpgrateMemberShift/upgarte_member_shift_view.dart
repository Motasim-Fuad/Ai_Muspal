import 'package:ai_muspal/resource/Colors/app_colors.dart';
import 'package:ai_muspal/view/UpgrateMemberShift/member/Platinum%20_Member_view.dart';
import 'package:ai_muspal/view/UpgrateMemberShift/member/Valued_Member_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpgarteMemberShiftView extends StatefulWidget {
  const UpgarteMemberShiftView({super.key});

  @override
  State<UpgarteMemberShiftView> createState() => _UpgarteMemberShiftViewState();
}

class _UpgarteMemberShiftViewState extends State<UpgarteMemberShiftView> {
  final selectedScreenIndex = 0.obs;
  final PageController _pageController = PageController();

  void _onTabTapped(int index) {
    selectedScreenIndex.value = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onPageChanged(int index) {
    selectedScreenIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

   final activeColor = AppColor.prymaryTextColor;
    final inactiveColor = theme.textTheme.bodyMedium?.color?.withOpacity(0.6) ?? Colors.grey;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("升級AI MusPal"),
      ),
      body: Padding(
        padding: const EdgeInsets.only( left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _onTabTapped(0),
                  child: Obx(() => Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: selectedScreenIndex.value == 0
                              ? activeColor
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      "尊貴會員",
                      style: TextStyle(
                        color: selectedScreenIndex.value == 0
                            ? activeColor
                            : inactiveColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ),
                SizedBox(width: 30,),
                GestureDetector(
                  onTap: () => _onTabTapped(1),
                  child: Obx(() => Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: selectedScreenIndex.value == 1
                              ? activeColor
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      "白金會員",
                      style: TextStyle(
                        color: selectedScreenIndex.value == 1
                            ? activeColor
                            : inactiveColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [

                   ValuedMemberView(),
                  PlatinumMemberView(),

                  // StSaveTutorinfo(),
                  // StHiredTutorinfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}