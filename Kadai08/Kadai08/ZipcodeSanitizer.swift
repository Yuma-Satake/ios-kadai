import Foundation

extension String {
    var digitsOnlyHalfWidth: String {
        let halfWidth = self.applyingTransform(.fullwidthToHalfwidth, reverse: false) ?? self
        return halfWidth.filter { $0.isNumber }
    }
} 