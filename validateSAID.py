def check(identifier):
    if not identifier.isdigit() or len(identifier) != 10 or identifier[0] not in ("1", "2"):
        return -1

    checksum = 0
    for digit, num in enumerate(identifier):
        num = int(num)
        checksum += sum(map(int, str(num * 2))) if digit % 2 == 0 else num

    return identifier[0] if checksum % 10 == 0 else -1
