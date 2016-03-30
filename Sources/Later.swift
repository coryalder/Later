
import Foundation

public struct Later {
  let timeout: Int64
  let semaphore = dispatch_semaphore_create(0)
  
  public init(_ timeout: Int64 = 5) {
    self.timeout = timeout * Int64(NSEC_PER_SEC)
  }
  
  public func wait() {
    let timeUp = dispatch_time(DISPATCH_TIME_NOW, self.timeout)
    dispatch_semaphore_wait(semaphore, timeUp == 0 ? DISPATCH_TIME_FOREVER : timeUp)
  }
  
  public func done() {
    dispatch_semaphore_signal(semaphore)
  }
}

