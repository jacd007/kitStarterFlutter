// Main
import 'package:flutter/material.dart';

export 'routes.dart';
export 'constants.dart';
export 'endpoints.dart';

// Utilities
export 'utilities/mShared.dart';
export 'utilities/custom_icons.dart';
export 'utilities/api_services.dart';
export 'utilities/check_platform.dart';
export 'utilities/utils.dart';
export 'utilities/utils_dialog.dart';
export 'utilities/utils_styles.dart';
export 'utilities/web_view_utils.dart';
export 'utilities/notification_api.dart';
export 'utilities/awesome_notification.dart';
export 'utilities/responsive_widgets.dart';
export 'utilities/will_pop_scope.dart';

// Translation
export 'translations/languages.dart';
export 'translations/translation_keys.dart';
// ignore: depend_on_referenced_packages
export 'package:flutter_localizations/flutter_localizations.dart';

// Themes
export 'themes/custom_colors.dart';
export 'themes/custom_text_theme.dart';

// ======================

extension GestureFocus on Widget {
  Widget unfocusText() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: this,
    );
  }
}
