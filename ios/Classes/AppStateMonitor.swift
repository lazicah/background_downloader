import UIKit

class AppStateMonitor {
    static let shared = AppStateMonitor()

    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func appDidBecomeActive() {
        print("App moved to the foreground")
        // Handle app moving to the foreground
        DownloadManager.shared.switchToForeground()
    }

    @objc private func appDidEnterBackground() {
        print("App entered the background")
        // Handle app moving to the background
        DownloadManager.shared.switchToBackground()
    }
}
