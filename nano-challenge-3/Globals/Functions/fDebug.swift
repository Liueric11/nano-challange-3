import Foundation
import os

func debug ( _ message: String ) {
    if ( AppConfig.debugMode ) {
        Logger.shared.log("\(message)")
    }
} 
