import UIKit
import Foundation

class ContactUsViewController: UIViewController {
  
  @IBOutlet weak var contactexample: UILabel!
  
  //to go back to settings
  @IBAction func dismissPressed(_ sender:Any) {
     self.dismiss(animated: true, completion: nil)
  }
  
}
