import Foundation

class StepDetector {
    
    private var count = 0
    var callBackSD: CallBackSD?
    
    
    func start() {
        repeat {
            count += 1
            sleep(4)
            stepDetected()
        } while (count < 10)
    }
    
    func stop() {
        
    }
    
    

    private func stepDetected() {
        print("Step detected \(count)")
        callBackSD?.step(steps: count)
    }
    
}



protocol CallBackSD {
    func step(steps: Int)
}
