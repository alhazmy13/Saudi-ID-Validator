def check(nid):
    # cast in case input is int
    nid = str(nid).strip()

    if not nid.isdigit() or len(nid) != 10:
        return '-1'

    id_type = nid[0]

    if id_type not in ('1', '2'):
        return '-1'

    total = 0
    for i in range(0, 10):
        if i % 2 == 0:
            multiplied = str(int(nid[i]) * 2)
            total += sum(map(int, multiplied))
        else:
            total += int(nid[i])

    return '-1' if total % 10 != 0 else id_type
