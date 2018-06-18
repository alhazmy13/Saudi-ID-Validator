object ValidateSAID {
 
  def check(value: String): Int = {
    val id = value.trim()
    if (!id.matches("[0-9]+")) {
      -1
    }
    if (id.length != 10) {
      -1
    }
    val idType: Int = id.substring(0, 1).toInt
    if (idType != 2 && idType != 1) {
      -1
    }
    var sum: Int = 0
    for (i <- 0.until(10)) {
      if (i % 2 == 0) {
        val ZFOdd: String = "%02d".format(
         (id.substring(i, i + 1)).toInt * 2)
        sum += (ZFOdd.substring(0, 1)).toInt + (ZFOdd.substring(1, 2)).toInt
      } else {
        sum += (id.substring(i, i + 1)).toInt
      }
    }
    if ((sum % 10 != 0)) -1 else idType
  }

}