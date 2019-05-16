def check(id):
    id = id.strip()
    if (id.isdigit() is False):
        return False
    if (len(id) != 10):
        return False
    type = id[0:1]
    if (type != '2' and type != '1'):
        return False
    sum = 0
    for i in range(0, 10):
        if (i % 2 == 0):
            ZFOdd = str(int(id[i]) * 2).zfill(2)
            sum += int(ZFOdd[0]) + int(ZFOdd[1])
        else:
            sum += int(id[i])
    isValid = -1 if sum % 10 != 0 else  type
    return isValid
