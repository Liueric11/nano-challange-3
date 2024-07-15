// © Kevin Gunawan 2024

import Foundation

extension Bundle {
    
    var appName : String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
}
