def check(id):
    not_valid = -1
    id = id.strip()
    if (id.isdigit() is False):
        return not_valid
    if (len(id) != 10):
        return not_valid
    type = id[0:1]
    if (type != '2' and type != '1'):
        return not_valid
    sum = 0
    for i in range(0, 10):
        if (i % 2 == 0):
            ZFOdd = str(int(id[i]) * 2).zfill(2)
            sum += int(ZFOdd[0]) + int(ZFOdd[1])
        else:
            sum += int(id[i])
    isValid = not_valid if sum % 10 != 0 else  type
    return isValid
