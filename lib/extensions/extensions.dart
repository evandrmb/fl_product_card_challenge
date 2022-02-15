import 'package:flutter/material.dart';

/// Reminder: don't do this in a real world project
/// it's not readable. If you want a less verbose way
///  to access properties of BuildContext prefer using
/// something like hooks
extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
