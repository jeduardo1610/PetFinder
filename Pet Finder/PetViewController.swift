/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */


import UIKit

protocol PetViewControllerDelegate: class {
  func petViewController(_ controller: PetViewController, didAdoptPet pet: Pet)
}

class PetViewController: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var petImageView: UIImageView!

  // MARK: - Properties
  weak var delegate: PetViewControllerDelegate?
  var pet: Pet!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = Theme.current.backgroundCellColor
    
    title = pet.name
    
    petImageView.image = UIImage(named: pet.imageName)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adopt", style: .plain, target: self, action: #selector(adopt))
  }
}

// MARK: - Actions
private extension PetViewController {

  @objc func adopt() {
    performSegue(withIdentifier: "ShowAdopt", sender: nil)
    delegate?.petViewController(self, didAdoptPet: pet)
  }
}
