import 'package:flutter/widgets.dart';

class Rounded {
  static BorderRadius get none => BorderRadius.zero;
  static BorderRadius get tiny => BorderRadius.circular(2.0);
  static BorderRadius get small => BorderRadius.circular(4.0);
  static BorderRadius get medium => BorderRadius.circular(6.0);
  static BorderRadius get large => BorderRadius.circular(8.0);
  static BorderRadius get full => BorderRadius.circular(9999.0);
}
