// ignore_for_file: prefer_const_constructors, file_names, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../core/core.dart';
import '../presentation.dart';

class DialFloatingButtonWidget extends StatefulWidget {
  final bool isHideButtons;
  final bool isMini;
  final bool isMethodHelps;
  final bool isLogin;

  const DialFloatingButtonWidget({
    this.isHideButtons = false,
    this.isMethodHelps = false,
    this.isLogin = false,
    this.isMini = false,
    Key? key,
  }) : super(key: key);

  @override
  State<DialFloatingButtonWidget> createState() =>
      _DialFloatingButtonWidgetState();
}

class _DialFloatingButtonWidgetState extends State<DialFloatingButtonWidget> {
  final AllController allctr = Get.find();
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  bool customDialRoot = true;
  bool extend = false;
  bool rmIcons = false;
  String _linkShop = '', _linkHelp = '', _phoneW = '', _email = '';

  @override
  void initState() {
    rmIcons = widget.isHideButtons;

    // Support
    _linkShop = linkShop;
    _linkHelp = linkHelp;
    _phoneW = allctr.contactSupportPhone.value;
    _email = allctr.contactSupportEmail.value;

    super.initState();
    // get API => /api/endpoint/{{ID}}
    // get data
    // update variables
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // animatedIcon: AnimatedIcons.menu_close,
      // animatedIconTheme: IconThemeData(size: 22.0),
      // / This is ignored if animatedIcon is non null
      // child: Text("open"),
      // activeChild: Text("close"),
      icon: Icons.question_mark,
      foregroundColor: white,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      // dialRoot: customDialRoot? (ctx, open, toggleChildren) {
      //   return ElevatedButton(
      //     onPressed: toggleChildren,
      //     style: ElevatedButton.styleFrom(
      //       primary: Colors.blue[900],
      //       padding: const EdgeInsets.symmetric(
      //           horizontal: 22, vertical: 18),
      //     ),
      //     child: const Text(
      //       "Custom Dial Root",
      //       style: TextStyle(fontSize: 17),
      //     ),
      //   );
      // } : null,
      // buttonSize: Size.fromRadius(35), // SpeedDial size which defaults to 56 itself
      // iconTheme: IconThemeData(size: 22),
      label:
          extend ? const Text("Open") : null, // The label of the main button.
      /// The active label of the main button, Defaults to label if not specified.
      activeLabel: extend ? const Text("Close") : null,

      /// Transition Builder between label and activeLabel, defaults to FadeTransition.
      // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
      /// The below button size defaults to 56 itself, its the SpeedDial childrens size
      // childrenButtonSize: Size.fromRadius(35),
      visible: true,
      direction: SpeedDialDirection.up,
      switchLabelPosition: false,

      /// If true user is forced to close dial manually
      closeManually: false,

      /// If false, backgroundOverlay will not be rendered.
      renderOverlay: true,
      // overlayColor: Colors.black,
      // overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      useRotationAnimation: true,
      // foregroundColor: Colors.black,
      // backgroundColor: Colors.white,
      // activeForegroundColor: Colors.red,
      // activeBackgroundColor: Colors.blue,
      elevation: 8.0,
      animationCurve: Curves.elasticInOut,
      isOpenOnStart: false,
      animationDuration: const Duration(milliseconds: 500),
      // shape: customDialRoot
      //     ? const RoundedRectangleBorder()
      //     : const StadiumBorder(),
      // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        SpeedDialChild(
          child: !rmIcons ? const Icon(Icons.support_agent) : null,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          label: Tk.helpUs.tr,
          onTap: funHelps,
          onLongPress: () => debugPrint('funHelps LONG PRESS'),
        ),
        if (widget.isMethodHelps)
          SpeedDialChild(
            child: !rmIcons ? const Icon(Icons.shopping_cart) : null,
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            label: Tk.shop.tr,
            onTap: funShop,
            onLongPress: () => debugPrint('funShop LONG PRESS'),
          ),
        SpeedDialChild(
          child: !rmIcons ? const Icon(CustomIcons.whatsapp) : null,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          label: Tk.advisory.tr,
          onTap: funWhatsapp,
          onLongPress: () => debugPrint('funWhatsapp LONG PRESS'),
        ),
        SpeedDialChild(
          child: !rmIcons ? const Icon(Icons.email) : null,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          label: Tk.advisory.tr,
          onTap: funEmail,
          onLongPress: () => debugPrint('funEmail LONG PRESS'),
        ),
        SpeedDialChild(
          child: !rmIcons ? const Icon(Icons.privacy_tip) : null,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          label: Tk.policies.tr,
          onTap: funPrivacy,
          onLongPress: () => debugPrint('funPrivacy LONG PRESS'),
        ),
        if (!widget.isLogin)
          SpeedDialChild(
            child: !rmIcons ? const Icon(Icons.delete_sweep_outlined) : null,
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            label: Tk.releaseDevice.tr,
            onTap: funClearCache,
            onLongPress: () => debugPrint('funClearCache LONG PRESS'),
          ),
      ],
    );
  }

  funShop() async {
    //  https://sistemapos.co/tienda
    WebViewUtils.launchInWebViewOrVC(_linkShop);
  }

  funHelps() async {
    // https://sistemapos.co/help/
    WebViewUtils.launchInWebViewOrVC(_linkHelp);
  }

  funPrivacy() async {
    // https://herramientasvirtuales.com/politica-de-privacidad-app-sistema-pos/
    WebViewUtils.launchInWebViewOrVC(linkPrivacy);
  }

  funWhatsapp() async {
    if (_phoneW.trim().isEmpty) {
      Utils.toast(Tk.notAdvisoryContact.tr);
    }

    try {
      WebViewUtils.launchWhatsapp(_phoneW, '');
    } catch (e) {
      WebViewUtils.launchWhatsApp2(_phoneW, '');
    }
  }

  funEmail() async {
    if (_email.trim().isEmpty) {
      Utils.toast(Tk.notAdvisoryContact.tr);
    }

    await Utils.sendEmail(
      recipients: [_email],
      subject: "${Tk.titleApp.tr} | ${Tk.tMenu5.tr}",
      body: '',
    );
  }

  funClearCache() async {
    // await allctr.clearDataInThisDevice();
    Utils.toast(Tk.noCachedFiles.tr);
    await Future.delayed(const Duration(seconds: 2));
    Utils.toast(Tk.redirected.tr);
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(Routes.main);
  }
}
