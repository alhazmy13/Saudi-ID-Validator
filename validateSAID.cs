class ValidateSAID {

    public int check(String id) {
        id = id.Trim();
        if (!Regex.IsMatch(id, @"[0-9]+")) {
            return -1;
        }
        if (id.Length != 10) {
            return -1;
        }
        int type = (int)(id[0]-'0');
        if (type != 2 && type != 1) {
            return -1;
        }
        int sum = 0;
        for (int i = 0; i < 10; i++) {
            if (i % 2 == 0) {
                String ZFOdd = ((int)(id[i]-'0') * 2).ToString().PadLeft(2, '0');
                sum += (int)(ZFOdd[0]-'0') + (int)(ZFOdd[1]-'0');
            } else {
                sum += (int)(id[i]-'0');
            }
        }
        return (sum % 10 != 0) ? -1 : type;

    }

} 
