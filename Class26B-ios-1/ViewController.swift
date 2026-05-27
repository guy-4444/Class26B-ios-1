import UIKit

// MARK: ViewController
class ViewController: UIViewController {
    
    @IBOutlet weak var lblCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hi Guy!")
        
        
        var sd = StepDetector()
        sd.callBackSD = self
        
        sd.start()

        
        
    }

    private func updateUI(value: Int) {
        lblCounter.text = "\(value)"
    }
    
}


// MARK: CallBackSD
extension  ViewController: CallBackSD {

    func step(steps: Int) {
        updateUI(value: steps)
    }
}



// MARK: ViewController2
extension  ViewController {

    func f1() {
        updateUI(value: 1)
    }
    
    
    
    
    
    func f2() {
        updateUI(value: 1)
    }
    
    
    
    
    
    
    
    func f3() {
        updateUI(value: 1)
    }
    
    
    
    
    
    
    
    func f4() {
        updateUI(value: 1)
    }
    
    
    
    
    
    
    func f5() {
        updateUI(value: 1)
    }
}
