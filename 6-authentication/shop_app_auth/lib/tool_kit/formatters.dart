import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

abstract class Formatters {
  //
  static final mobileFormatter = MaskedInputFormatter('0000-000-00-00');

  static final dateFormat = MaskedInputFormatter('0000/00/00');

  static final nationalCode = MaskedInputFormatter('00000000000');
}
