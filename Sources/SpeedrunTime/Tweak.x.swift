import Orion
import SpeedrunTimeC
import UIKit
import os

var percentage:Int?
var charging: Bool = false

class SBUIControllerHook: ClassHook<NSObject> {

    static let targetName = "SBUIController"

    func batteryCapacityAsPercentage() -> Int {
        let orig = orig.batteryCapacityAsPercentage()
        if percentage != orig {
            percentage = orig;
            if percentage == 1 {
                showLowAlert()
            }
        }

        return orig

    }
    
    // TODO: For "best records"
    func isBatteryCharging() -> Bool {
        let orig = orig.isBatteryCharging()
        if orig != charging {
            charging = orig
            logt("Charging Updated")
            if charging {
                logt("Currently charging")
            } else {
                logt("Currently unplugged")
            }
        }
        
        return orig
    }

    
    private func showLowAlert() {
        let messages = ["💀","who cares","i don't care","ok and","whatever","download 100%","oh well"]
        alert(title: "Speedrun time!", message: "\(percentage ?? 1)% remaining", action: messages.randomElement()!)
    }
    
    private func alert(title: String, message: String, action: String) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = UIWindow.Level.statusBar + 1
        let vc = UIViewController()
        window.rootViewController = vc
        window.isHidden = false
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .cancel, handler: { _ in
            window.isHidden = true
        }))
        vc.present(alert, animated: true)
    }
}

func logt(_ string: StaticString) {
    let log = OSLog.init(subsystem: "ovh.exerhythm.speedruntime", category: "main")
    os_log(string, log: log)
}

