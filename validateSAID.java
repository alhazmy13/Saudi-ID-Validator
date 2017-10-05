class ValidateSAID {

    public int check(String id) {
        id = id.trim();
        if (!id.matches("[0-9]+")) {
            return -1;
        }
        if (id.length() != 10) {
            return -1;
        }
        int type = Integer.parseInt(id.substring(0, 1));
        if (type != 2 && type != 1) {
            return -1;
        }
        int sum = 0;
        for (int i = 0; i < 10; i++) {
            if (i % 2 == 0) {
                String ZFOdd = String.format("%02d", Integer.parseInt(id.substring(i, i+1)) * 2);
                sum += Integer.parseInt(ZFOdd.substring(0, 1)) + Integer.parseInt(ZFOdd.substring(1, 2));
            } else {
                sum += Integer.parseInt(id.substring(i, i+1));
            }
        }
        return (sum % 10 != 0) ? -1 : type;

    }

}