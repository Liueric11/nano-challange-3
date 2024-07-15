import SwiftUI

extension Color {
    
    /// Returns the components that form the color in the RGB color space. Should the retrieve operation fails, it returns an invisible black (0, 0, 0, 0).
    func rawComponent () -> ( red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat ) {
        let uiColor = UIColor(self)
        
        var red   : CGFloat = 0
        var green : CGFloat = 0
        var blue  : CGFloat = 0
        var alpha : CGFloat = 0
        
        let success = uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        if success {
            return (red, green, blue, alpha)
        } else {
            return (0, 0, 0, 0)
        }
    }
}
