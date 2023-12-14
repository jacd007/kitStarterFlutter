// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanPage extends StatefulWidget {
  final ValueChanged<String?>? onValueChanged;
  final bool autoBack;
  final String title;

  const QrScanPage(
      {this.onValueChanged,
      this.autoBack = true,
      this.title = 'Mobile Scanner',
      super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: _builderFlash,
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: _builderCamera,
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        // fit: BoxFit.contain,
        controller: cameraController,
        onDetect: _onDetect,
      ),
    );
  }

  Widget _builderFlash(context, TorchState state, child) {
    switch (state) {
      case TorchState.off:
        return const Icon(Icons.flash_off, color: Colors.grey);
      case TorchState.on:
        return const Icon(Icons.flash_on, color: Colors.yellow);
    }
  }

  Widget _builderCamera(context, CameraFacing state, child) {
    switch (state) {
      case CameraFacing.front:
        return const Icon(Icons.camera_front);
      case CameraFacing.back:
        return const Icon(Icons.camera_rear);
    }
  }

  void _onDetect(capture) async {
    final List<Barcode> barcodes = capture.barcodes;
    // ignore: unused_local_variable
    final Uint8List? image = capture.image;
    for (final barcode in barcodes) {
      debugPrint('Barcode found! ${barcode.rawValue}');
    }
    await Future.delayed(const Duration(milliseconds: 50));

    if (widget.onValueChanged != null) {
      widget.onValueChanged!(barcodes.first.rawValue);
    }

    if (widget.autoBack) Get.back(result: barcodes.first.rawValue);
  }
}
