//: Playground - noun: a place where people can play

import UIKit
import Foundation


public enum NationaltyType {
    case saudi
    case nonSaudi
    case none
}

public enum ValidateSAIDError : Error {
    case unknown
    case lengthIssue
}


public struct ValidateSAID {
    
    public static func check(_ id: String) throws -> NationaltyType {
        
        let idString = id.trimmingCharacters(in: CharacterSet.whitespaces)
        
        if (idString.count != 10) {
            throw ValidateSAIDError.lengthIssue
        }
        
        guard let first = idString.first else {
            throw ValidateSAIDError.unknown
        }
        
        let firstStringValue = String(first)
        guard let type = Int(firstStringValue) else {
            throw ValidateSAIDError.unknown
        }
        
        if (type != 1 && type != 2) {
            throw ValidateSAIDError.unknown
        }
        
        if Int(idString) == nil {
            throw ValidateSAIDError.unknown
        }
        
        
        let reduced = idString.enumerated().reduce(0) { (sum, item) -> Int in
            let i = item.offset
            var sum1 = sum
            if (i % 2 == 0) {
                //print("\n\n \(#function), \(#line) value: \(idString.charAt(at: i))")
                let ZFOdd = String(format: "%02d", Int(String(idString.charAt(at: i)))! * 2)
                sum1 += Int(String(ZFOdd.charAt(at: 0)))! + Int(String(ZFOdd.charAt(at: 1)))!
            } else {
                sum1 += Int(String(idString.charAt(at: i)))!
            }
            return sum1
        }
        
        var sum1 = 0
        for i in 0...idString.count-1 {
            if (i % 2 == 0) {
                //print("\n\n \(#function), \(#line) value: \(idString.charAt(at: i))")
                let ZFOdd = String(format: "%02d", Int(String(idString.charAt(at: i)))! * 2)
                sum1 += Int(String(ZFOdd.charAt(at: 0)))! + Int(String(ZFOdd.charAt(at: 1)))!
            } else {
                sum1 += Int(String(idString.charAt(at: i)))!
            }
        }
        
        print("\n\n \(#function), \(#line) value: \(sum1)")
        print("\n\n \(#function), \(#line) value: \(reduced)")
        
        if (sum1 % 10 != 0) {
            throw ValidateSAIDError.unknown
        }else if  (type == 1) {
            return NationaltyType.saudi
        }else if  (type == 2) {
            return NationaltyType.nonSaudi
        }else {
            throw ValidateSAIDError.unknown
        }
    }
}

extension String {
    
    func charAt(at: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: at)
        return self[charIndex]
    }
}
