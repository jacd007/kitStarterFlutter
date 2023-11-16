import 'package:flutter/material.dart';
import '../../../presentation/presentation.dart';
import '../../../core/core.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AllController allctr = Get.find();
    final cc = CustomColors(context, dark: buttonColor3, light: buttonColor);
    int maxRange = 5;

    return WillPopScope(
      onWillPop: allctr.onWillPop,
      child: Obx(() {
        return Scaffold(
          body: ResponsiveWidget(
            mobileScreen: SafeArea(child: allctr.screenChange),
            desktopScreen: SafeArea(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: SizedBox(
                        // width: allctr.showTextMenuDesktop.value ? null : 75,
                        child: BottomNavBarWidget(
                          isDesktop: true,
                          textDesktop: APP_NAME,
                          currentIndex:
                              allctr.selectedIndex.value.clamp(0, maxRange),
                          selectedItemColor: cc.colorThemeMode,
                          unselectedItemColor: grey600,
                          onItemTapped: allctr.onItemTapped,
                          tintLastWidget: false,
                          icons: allctr.icons.getRange(0, maxRange).toList(),
                          titles: allctr.titles.getRange(0, maxRange).toList(),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Card(
                        elevation: 1,
                        shape: borderCard(),
                        child: allctr.screenChange,
                      ),
                    ),
                    const Flexible(child: SizedBox.shrink()),
                  ]),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: MediaQuery.of(context).size.width < 600,
            child: BottomNavBarWidget(
              currentIndex: allctr.selectedIndex.value.clamp(0, maxRange),
              selectedItemColor: cc.colorThemeMode,
              unselectedItemColor: grey600,
              onItemTapped: allctr.onItemTapped,
              tintLastWidget: false,
              icons: allctr.icons.getRange(0, maxRange).toList(),
              titles: allctr.titles.getRange(0, maxRange).toList(),
            ),
          ),
        );
      }),
    );
  }
}
