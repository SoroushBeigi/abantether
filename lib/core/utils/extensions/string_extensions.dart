extension PriceExtension on String {
  String splitPriceByComma() {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc(Match match) => '${match[1]},';
    var text = this;
    return text.replaceAllMapped(reg, mathFunc);
  }

  String addPriceTag() {
    const String tag = '\$';

    return tag + this;
  }
}
