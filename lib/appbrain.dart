import 'package:flutter/cupertino.dart';

import 'quistion.dart';

class Appbrain {
  List<QQuistion> _qgrups = [
    QQuistion(
        q: ' اجمل شاب في العالم هو انت', i: 'images/aa (1).jpg', a: false),
    QQuistion(
        q: ' عدد كواكب المجموعة الشمسية هو احدعشر كوكب ',
        i: 'images/aa (2).jpg',
        a: true),
    QQuistion(q: '  اعلى قمة جبل هي افرست  ', i: 'images/aa (3).jpg', a: true),
    QQuistion(
        q: 'عدد الورود في الصورة هو 5 ورود ', i: 'images/aa (4).jpg', a: false),
  ];

  int _qn = 0;

  void getqn() {
    if (_qn < _qgrups.length - 1) {
      _qn++;
    }
  }

  String getqustiontext() {
    return _qgrups[_qn].qtext;
  }

  String getqustionimage() {
    return _qgrups[_qn].qimage;
  }

  bool getqustionanswer() {
    return _qgrups[_qn].qanswer;
  }

  bool isfinished() {
    if (_qn == _qgrups.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    _qn = 0;
  }
}
