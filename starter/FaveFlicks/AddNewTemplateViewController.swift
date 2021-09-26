import UIKit
import Foundation
import SwiftUI

class AddNewTemplateViewController: UIViewController, DataEnteredDelegate{
  var text:String = ""

  @IBOutlet weak var textLabel: UILabel!
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    textLabel?.text = text
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "showExerciseTemplate" {
              let templateExerciseViewController = segue.destination as! TemplateExerciseViewController
            templateExerciseViewController.delegate = self
          }
      }

      func userDidEnterInformation(info: String) {
          textLabel.text = info
      }
  
  
}

