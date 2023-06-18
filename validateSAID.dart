class ValidateSAID {
  static final RegExp _numericRegex = RegExp(r'^\d+$');
  static const int _idLength = 10;
  static const int _type1 = 1;
  static const int _type2 = 2;

  int check(String id) {
    id = id.trim();
	  int type = int.parse(id.substring(0, 1));
    if (!_numericRegex.hasMatch(id) || id.length != _idLength || (type != _type1 && type != _type2)) {
      return -1;
    }
	  int sum = 0;
    for (int i = 0; i < _idLength; i++) {	  
	  if (i.isEven) {
        String ZFOdd = "${int.parse(id.substring(i, i+1)) * 2}".padLeft(2, '0');
        sum += int.parse(ZFOdd.substring(0, 1)) + int.parse(ZFOdd.substring(1, 2));
      } else {
        sum += int.parse(id.substring(i, i+1));
      }
    }
    return (sum % 10 != 0) ? -1 : type;
  }
  
}
