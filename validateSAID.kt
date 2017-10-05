public  class ValidateSAID {

    fun check(id: String): Int {
        var id = id
        id = id.trim { it <= ' ' }
        if (!id.matches("[0-9]+".toRegex())) {
            return -1
        }
        if (id.length != 10) {
            return -1
        }
        val type = Integer.parseInt(id.substring(0, 1))
        if (type != 2 && type != 1) {
            return -1
        }
        var sum = 0
        for (i in 0..9) {
            if (i % 2 == 0) {
                val ZFOdd = "%02d".format(Integer.parseInt(id.substring(i, i + 1)) * 2)
                sum += Integer.parseInt(ZFOdd.substring(0, 1)) + Integer.parseInt(ZFOdd.substring(1, 2))
            } else {
                sum += Integer.parseInt(id.substring(i, i + 1))
            }
        }
        return if (sum % 10 != 0) -1 else type

    }

}