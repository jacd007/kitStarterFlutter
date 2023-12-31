import 'package:flutter/material.dart';
import '../../../../presentation/presentation.dart';

class Home2Screen extends StatelessWidget {
  const Home2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    const miniCenterTop = FloatingActionButtonLocation.miniCenterTop;
    return GetBuilder<HomeController>(builder: (homeCtr) {
      final vFloating = homeCtr.showButtonToStartScroll.value;
      final vLoading = homeCtr.hasMoreToLoad1.isFalse;

      return Scaffold(
        body: AnimatedIterableWidgets(
          controller: homeCtr.scrollCtr1,
          type: StaggeredIterableType.grid,
          crossAxisCount: 3,
          animationChild: StaggeredAnimationsType.scale,
          animationParent: StaggeredAnimationsType.slide,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.33,
          builder: (index, report) => _ExampleWidget(data: report.data),
          children: homeCtr.listUndefined,
          /*  builder: AnimatedIterableWidgets.defaultBuilder,
          list: List.generate(20, (i) => ListTile(title: Text('data $i'))), */
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
