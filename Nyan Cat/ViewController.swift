//
//  ViewController.swift
//  Nyan Cat
//
//  Created by Yohannes Wijaya on 7/8/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var counter = 1
    var interval = NSTimer()
    var arrayOfNyanCats: [UIImage] = [
        UIImage(named: "nyanCat_frame1")!,
        UIImage(named: "nyanCat_frame2")!,
        UIImage(named: "nyanCat_frame3")!,
        UIImage(named: "nyanCat_frame4")!,
        UIImage(named: "nyanCat_frame5")!,
        UIImage(named: "nyanCat_frame6")!,
        UIImage(named: "nyanCat_frame7")!,
        UIImage(named: "nyanCat_frame8")!,
        UIImage(named: "nyanCat_frame9")!,
        UIImage(named: "nyanCat_frame10")!,
        UIImage(named: "nyanCat_frame11")!,
        UIImage(named: "nyanCat_frame12")!,
    ]
    
    @IBOutlet weak var footnoteLabel: UILabel!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBAction func animateGifButton(sender: UIButton) {
        interval = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "changeGifImages", userInfo: nil, repeats: true)
    }
    @IBAction func stopGifButton(sender: UIButton) {
        interval.invalidate()
    }
    @IBAction func repeatAnimateGifButton(sender: UIButton) {
        changeGifImages()
    }
    
    // MARK: - Custom methods
    
    func changeGifImages() {
        if counter == arrayOfNyanCats.count { counter = 1 }
        else {
            gifImageView.image = arrayOfNyanCats[counter]
            counter++
        }
    }
    
    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.footnoteLabel.center = CGPointMake(self.footnoteLabel.center.x, self.footnoteLabel.center.y + 30)
        self.gifImageView.center = CGPointMake(gifImageView.center.x - gifImageView.bounds.size.width, gifImageView.center.y)
        self.gifImageView.animationImages = arrayOfNyanCats
        self.gifImageView.animationDuration = 1.3
        self.gifImageView.animationRepeatCount = 1
        self.gifImageView.alpha = 0
        self.gifImageView.startAnimating()
        UIView.animateWithDuration(1) { () -> Void in
            self.footnoteLabel.center = CGPoint(x: self.footnoteLabel.center.x, y: self.footnoteLabel.center.y - 30)
            self.gifImageView.center = CGPointMake(self.gifImageView.center.x + self.gifImageView.bounds.size.width, self.gifImageView.center.y)
            self.gifImageView.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}