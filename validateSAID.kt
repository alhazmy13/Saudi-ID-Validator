fun isValiedId(id: String): IdType {
    val trimId = id.trim { it <= ' ' }
    if (!trimId.matches("[0-9]+".toRegex())) {
        return IdType.NOT_VALID
    }
    if (trimId.length != 10) {
        return IdType.NOT_VALID
    }
    val type = Integer.parseInt(trimId.substring(0, 1))
    if (type != 2 && type != 1) {
        return IdType.NOT_VALID
    }
    var sum = 0
    for (i in 0..9) {
        if (i % 2 == 0) {
            val zfOdd = "%02d".format(Integer.parseInt(trimId.substring(i, i + 1)) * 2)
            sum += Integer.parseInt(zfOdd.substring(0, 1)) + Integer.parseInt(zfOdd.substring(1, 2))
        } else {
            sum += Integer.parseInt(trimId.substring(i, i + 1))
        }
    }
    return if (sum % 10 != 0) IdType.NOT_VALID else IdType.from(type)
}

enum class IdType(val value: Int) {
    SAUDI(1), RESIDENT(2), NOT_VALID(-1);

    companion object {
        fun from(findValue: Int): IdType = IdType.values().first { it.value == findValue }
    }
}
