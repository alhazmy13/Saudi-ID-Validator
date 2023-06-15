class ValidateSAID {
  int check(String id) {
    id = id.trim();
    if (!RegExp(r'^\d+$').hasMatch(id)) {
      return -1;
    }
    if (id.length != 10) {
      return -1;
    }
    int type = int.parse(id.substring(0, 1));
    if (type != 2 && type != 1) {
      return -1;
    }
    int sum = 0;
    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        String ZFOdd = "${int.parse(id.substring(i, i+1)) * 2}".padLeft(2, '0');
        sum += int.parse(ZFOdd.substring(0, 1)) + int.parse(ZFOdd.substring(1, 2));
      } else {
        sum += int.parse(id.substring(i, i+1));
      }
    }
    return (sum % 10 != 0) ? -1 : type;
  }
  
}
