import UIKit
import Foundation
import SwiftUI

class WorkoutViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return labels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellWorkoutTemplate", for: indexPath) as! MyCollectionCollectionViewCell
    cell.myLabel.text = labels[indexPath.row]
    cell.myLabel.layer.cornerRadius = 50.0
    
    return cell
  }
  
  
  var labels:[String] = ["Label 1", "Label 2", "Label 3", "Label 4"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  /*@IBAction func addNewTemplate(_ sender: Any) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil);
    let vc = storyboard.instantiateViewController(withIdentifier: "addNewTemplate") as! UIViewController; // MySecondSecreen the storyboard ID
    self.present(vc, animated: true, completion: nil);
        }*/
}
