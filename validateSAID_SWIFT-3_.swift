import Foundation

struct ValidateSAID{
    public func check(idNumber: String) -> Int {
        let id = idNumber.trimmingCharacters(in: NSCharacterSet.whitespaces)
        if (Int(id) == nil) {
            return -1;
        }
        if (id.characters.count != 10) {
            return -1;
        }
        let type = Int(String(id.charAt(at: 0)))!
        if (type != 2 && type != 1) {
            return -1;
        }
        var sum = 0;
        for i in 0...9 {
            if (i % 2 == 0) {
                let ZFOdd = String(format: "%02d", Int(String(id.charAt(at: i)))! * 2)
                sum += Int(String(ZFOdd.charAt(at: 0)))! + Int(String(ZFOdd.charAt(at: 1)))!
            } else {
                sum += Int(String(id.charAt(at: i)))!
            }
        }
        return (sum % 10 != 0) ? -1 : type
    }
}

extension String {
    
    func charAt(at: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: at)
        return self[charIndex]
    }
}
