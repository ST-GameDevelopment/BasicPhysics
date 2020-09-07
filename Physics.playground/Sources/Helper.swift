import Foundation


public func delay(seconds: TimeInterval,
                  completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds,
                                  execute: completion)
}
