import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

extension Validator on String {
  bool validateMinLength(length) {
    if (isEmptyOrNull) {
      return false;
    }

    if (this.length < length) {
      return false;
    }

    return true;
  }

  bool validateMaxLength(length) {
    if (isEmptyOrNull) {
      return false;
    }

    if (this.length > length) {
      return false;
    }
    return true;
  }
}

extension Widgets on List<Widget> {
  Widget toColumn({
    mainAxisAlignment= MainAxisAlignment.start,
    crossAxisAlignment= CrossAxisAlignment.start
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: this,
    );
  }

  Widget toRow({
    mainAxisAlignment= MainAxisAlignment.start,
    crossAxisAlignment= CrossAxisAlignment.start
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: this,
    );
  }
}

extension ListExtensions<T> on List<T> {
  T? getRandomElement() {
    if (isEmpty) return null;
    Random random = Random.secure();
    return this[random.nextInt(length)];
  }
}