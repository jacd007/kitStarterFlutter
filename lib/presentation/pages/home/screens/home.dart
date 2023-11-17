import 'package:flutter/material.dart';
import '../../../../presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const miniCenterTop = FloatingActionButtonLocation.miniCenterTop;
    return GetBuilder<HomeController>(builder: (homeCtr) {
      final vFloating = homeCtr.showButtonToStartScroll.value;
      final vLoading = homeCtr.hasMoreToLoad1.isFalse;

      return Scaffold(
        body: AnimatedIterableWidgets(
          controller: homeCtr.scrollCtr1,
          type: StaggeredIterableType.column,
          crossAxisCount: 3,
          animationChild: StaggeredAnimationsType.slide,
          animationParent: StaggeredAnimationsType.fadeIn,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.33,
          /* builder: (index, report) => _ExampleWidget(data: report.data),
          children: homeCtr.listUndefined, */
          builder: AnimatedIterableWidgets.defaultBuilder,
          children: homeCtr.listUndefined
              .map((e) => _ExampleWidget(data: e.data))
              .toList(),
        ),
        floatingActionButtonLocation: miniCenterTop,
        floatingActionButton: ButtonToStartScroll(
          visible: vFloating,
          onPressed: homeCtr.toStartScroll,
        ),
        bottomNavigationBar: ButtonToStartScroll.loadingWidget(vLoading),
      );
    });
  }
}

// ========================================================================
///
/// TEST WIDGET
///
class _ExampleWidget extends StatelessWidget {
  final String data;
  const _ExampleWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadiusDirectional.circular(14),
        ),
        child: Center(
          child: Text(
            data,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
