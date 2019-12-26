import UIKit

let modifiedString = "SOSSPSSQSSOR"


func marsExploration2(s: String) -> Int {

    var errorsInChain = 0
    stride(from: 0, to: s.count, by: 3).forEach {
        errorsInChain = s[$0] == "S" ? errorsInChain : errorsInChain + 1
        errorsInChain = s[$0+1] == "O" ? errorsInChain : errorsInChain + 1
        errorsInChain = s[$0+2] == "S" ? errorsInChain : errorsInChain + 1
    }
    return errorsInChain
}

func marsExploration(s: String) -> Int {
    let sos = s.split(by: 3)
    return sos.reduce(0) { (errors, sosChain) in
        var errorsInChain = errors
        errorsInChain = sosChain[0] == "S" ? errorsInChain : errorsInChain + 1
        errorsInChain = sosChain[1] == "O" ? errorsInChain : errorsInChain + 1
        errorsInChain = sosChain[2] == "S" ? errorsInChain : errorsInChain + 1
        return errorsInChain
    }
    
}
extension StringProtocol {
    subscript(_ offset: Int)  -> Element  { return self[index(startIndex, offsetBy: offset)] }
}
extension String {
    func split(by length: Int) -> [String] {
        return stride(from: 0, to: self.count, by: length).compactMap { i -> String in
            let startIndex = self.index(self.startIndex, offsetBy: i, limitedBy: self.endIndex) ?? self.endIndex
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[startIndex..<endIndex])
        }
    }
}


marsExploration2(s: modifiedString)
