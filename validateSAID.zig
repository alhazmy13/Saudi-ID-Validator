pub fn validateSaudiId(identifier: []const u8) i8 {
    if (identifier.len != 10) return -1;
    if (identifier[0] != '1' and identifier[0] != '2') {
        return -1;
    }
    var checksum: u8 = 0;
    for (identifier, 0..) |character, index| {
        var digit: u8 = switch (character) {
            '0'...'9' => character - '0',
            else => return -1,
        };
        if (index % 2 == 0) {
            digit *= 2;
            if (digit > 9) {
                digit -= 9;
            }
        }
        checksum += digit;
    }
    return if (checksum % 10 == 0) 1 else -1;
}