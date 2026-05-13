import UIKit

class GameController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnClickMe: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hi Game!")
        
        
    }

    @IBAction func clickMeFuncf(_ sender: Any) {
        lblName.text = "Hi Guy!"
        btnClickMe.isEnabled = false
    }
    
}

