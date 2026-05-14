import UIKit

class TriviaController: UIViewController {
    
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var btnAns1: UIButton!
    @IBOutlet weak var btnAns2: UIButton!
    @IBOutlet weak var btnAns3: UIButton!
    @IBOutlet weak var btnAns4: UIButton!
    @IBOutlet weak var imgResult: UIImageView!
    
    let v_answer = #imageLiteral(resourceName: "check")
    let x_answer = #imageLiteral(resourceName: "delete")
    
    var imageArray: [UIImage] = [ #imageLiteral(resourceName: "china"),#imageLiteral(resourceName: "france"),#imageLiteral(resourceName: "india"),#imageLiteral(resourceName: "israel"),#imageLiteral(resourceName: "mexico"), #imageLiteral(resourceName: "mongolia"),#imageLiteral(resourceName: "nepal"),#imageLiteral(resourceName: "russia"),#imageLiteral(resourceName: "sri lanka"),#imageLiteral(resourceName: "united kingdom")]
    let names: [String] = ["brazil","china","france","india","israel","mexico","mongolia","nepal","russia","sri lanka","uk"]
    
    var imdex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hi Game!")
        
        
        btnAns2.setTitle("dfdf", for: .normal)
        
        
        imgFlag.image = UIImage(named: "israel")
        imgFlag.image = #imageLiteral(resourceName: "israel")
        

        updateUI()
        
    }
    
    func updateUI(){
        btnAns1.setTitle(names[imdex], for: .normal)
//        btnAns1.titleLabel?.text = names[imdex]
        imgFlag.image = UIImage(named: names[imdex])
        
        
    }
    
    

    @IBAction func answerClicked(_ sender: UIButton) {
        let answer = sender.titleLabel!.text!
        let resultImage = (answer == names[imdex]) ? v_answer : x_answer
        imgResult.image = resultImage

        imdex += 1
        updateUI()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.imgResult.image = nil
        }
    }
    
    

}

