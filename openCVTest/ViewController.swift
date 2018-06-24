//
//  ViewController.swift
//  openCVTest
//
//  Created by skrr on 24.06.18.
//  Copyright © 2018 mic.st. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
  @IBOutlet weak var inputImage: UIImageView!

  @IBOutlet weak var upperSlider: UISlider!
  @IBOutlet weak var lowerSlider: UISlider!
  @IBOutlet weak var sliderView: UISlider!
  @IBOutlet weak var outputImage: UIImageView!

  @IBOutlet weak var thresholdLabel: UILabel!
  
  @IBAction func sliderLower(_ sender: Any) {
    outputImage.image = makeGray(image: inputImage.image)
    thresholdLabel.text = "lower: \(lowerSlider.value) upper: \(upperSlider.value)"
  }
  @IBAction func slideUpper(_ sender: Any) {
    outputImage.image = makeGray(image: inputImage.image)
    thresholdLabel.text = "lower: \(lowerSlider.value) upper: \(upperSlider.value)"
  }
  let opencvWrapper = OpenCVWrapper();
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

  }
  
  func makeGray(image: UIImage?) -> UIImage {
    if image != nil {
      return opencvWrapper.threshold(image!, thresholdLower: Int32(lowerSlider.value), threshholdUpper: Int32(upperSlider.value))
    } else {
      return UIImage.init()
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

