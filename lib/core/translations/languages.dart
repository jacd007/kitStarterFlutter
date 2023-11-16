import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en.dart';
import 'es.dart';

/// Clase encargada de la configuración de idiomas de la aplicación.
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es_ES': Es().messages,
        'en_US': En().messages,
      };
}

const supportedLocales = [
  Locale("en"),
  Locale("es", "ES"),
];
