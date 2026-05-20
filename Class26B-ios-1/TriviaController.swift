import UIKit

class TriviaController: UIViewController {
    
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var btnAns1: UIButton!
    @IBOutlet weak var btnAns2: UIButton!
    @IBOutlet weak var btnAns3: UIButton!
    @IBOutlet weak var btnAns4: UIButton!
    @IBOutlet weak var imgResult: UIImageView!
    
    var btnArr: [UIButton] = []
    
    let v_answer = #imageLiteral(resourceName: "check")
    let x_answer = #imageLiteral(resourceName: "delete")
    
    var imageArray: [UIImage] = [ #imageLiteral(resourceName: "brazil"),#imageLiteral(resourceName: "china"),#imageLiteral(resourceName: "france"),#imageLiteral(resourceName: "india"),#imageLiteral(resourceName: "israel"),#imageLiteral(resourceName: "mexico"), #imageLiteral(resourceName: "mongolia"),#imageLiteral(resourceName: "nepal"),#imageLiteral(resourceName: "russia"),#imageLiteral(resourceName: "sri lanka"),#imageLiteral(resourceName: "uk")]
    let names: [String] = ["brazil","china","france","india","israel","mexico","mongolia","nepal","russia","sri lanka","uk"]
    
    var imdex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnArr = [btnAns1, btnAns2, btnAns3, btnAns4]
        
        print("Hi Game!")
        
        
        btnAns2.setTitle("dfdf", for: .normal)
        
        
        imgFlag.image = UIImage(named: "israel")
        imgFlag.image = #imageLiteral(resourceName: "israel")
        

        updateUI()
        
    }
    
    func updateUI(){
//        if (imdex >= names.count) {
        if (imdex == 1) {
            gameOver()
        }
        
        var set: Set<Int> = []
        set.insert(imdex)
        
        let randomIndex = Int.random(in: 0 ..< 4)
        btnArr[randomIndex].setTitle(names[imdex], for: .normal)
        
        for i in 0 ..< btnArr.count {
            if (i == randomIndex) { continue }
            
            var rand = Int.random(in: 0 ..< names.count)
            while (set.contains(rand)) {
                rand = Int.random(in: 0 ..< names.count)
            }
            
            btnArr[i].setTitle(names[rand], for: .normal)
        }

        
        

        
        
//        btnAns1.titleLabel?.text = names[imdex]
        imgFlag.image = UIImage(named: names[imdex])
        
        
    }
    
    

    @IBAction func answerClicked(_ sender: UIButton) {
        let answer = sender.titleLabel!.text!
        let resultImage = (answer == names[imdex]) ? v_answer : x_answer
        imgResult.image = resultImage

        imdex += 1
        
        btnAns1.isEnabled = false
        btnAns2.isEnabled = false
        btnAns3.isEnabled = false
        btnAns4.isEnabled = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.actionAfterAnswerDelay()
        }
    }
    
    func actionAfterAnswerDelay() {
        imgResult.image = nil
        
        updateUI()
        
        btnAns1.isEnabled = true
        btnAns2.isEnabled = true
        btnAns3.isEnabled = true
        btnAns4.isEnabled = true
    }

    func gameOver() {
        // create the actual alert controller view that will be the pop-up
        let alertController = UIAlertController(title: "Game Over", message: "Enter your name", preferredStyle: .alert)

        alertController.addTextField { (textField) in
            // configure the properties of the text field
            textField.placeholder = "Name"
        }
        
        alertController.addTextField { (textField) in
            // configure the properties of the text field
            textField.placeholder = "Score"
        }


        // add the buttons/actions to the view controller
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in

            // this code runs when the user hits the "save" button

            let inputName = alertController.textFields![0].text

            print(inputName)
            
            self.showToast(message: inputName!)

        }

        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)

        present(alertController, animated: true, completion: nil)
    }

}

