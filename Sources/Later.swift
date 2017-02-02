
import Foundation

public struct Later {
  let timeout: UInt64
  let semaphore = DispatchSemaphore(value: 0)
  
  public init(_ timeout: UInt64 = 5) {
    self.timeout = timeout * UInt64(NSEC_PER_SEC)
  }
  
  public func wait() {
    let targetTimeInteger = DispatchTime.now().uptimeNanoseconds + self.timeout
    
    let waitUntil = targetTimeInteger == 0 ? .distantFuture : DispatchTime(uptimeNanoseconds: targetTimeInteger)
    
    _ = semaphore.wait(timeout: waitUntil)
  }
  
  public func done() {
    semaphore.signal()
  }
}

