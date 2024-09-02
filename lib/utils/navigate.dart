import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';

goTo(screen, {trans = PageTransitionType.leftToRight}) {
  if(screen is String){
    return Navigator.of(getContext).pushNamed(screen);
  }

  return Navigator.of(getContext).push(PageTransition(child: screen, type: trans));
}

goToReplace(screen, {trans= PageTransitionType.leftToRight}) {
  if(screen is String){
    return Navigator.of(getContext).pushReplacementNamed(screen);
  }

  return Navigator.of(getContext)
      .pushReplacement(PageTransition(child: screen, type: trans));
}

goToRemove(screen, {trans= PageTransitionType.leftToRight}) {
  return Navigator.of(getContext).pushAndRemoveUntil(
      PageTransition(child: screen, type: trans), (_) => false);
}