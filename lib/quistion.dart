class QQuistion {
  late String qtext;
  late String qimage;
  late bool qanswer;
  QQuistion({String q = '', String i = '', bool a = true}) {
    qtext = q;
    qimage = i;
    qanswer = a;
  }
}
