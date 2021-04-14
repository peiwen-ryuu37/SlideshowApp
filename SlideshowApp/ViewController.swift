//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Liu Peiwen on 2021/04/14.
//

import UIKit

class ViewController: UIViewController {
    
    //画像配列index
    var nowIndex = 0
    
    //画像配列
    var imageArray: [UIImage] = [
        UIImage(named: "athia01-01")!,
        UIImage(named: "athia02-01")!,
        UIImage(named: "athia03-01")!,
        UIImage(named: "takia01-01")!,
        UIImage(named: "takia02-01")!,
        UIImage(named: "takia03-01")!
    ]
    
    
    @IBOutlet weak var nowImageView: UIImageView!
    @IBOutlet weak var playAndStopLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //最初の画像設置
        self.setImage()
    }
    
    @IBAction func forwardButton(_ sender: UIButton) {
        print("forwardButton be tapped")
        self.imageForward()
    }
    
    @IBAction func backwardButton(_ sender: UIButton) {
        print("backwardButton be tapped")
        self.imageBackward()
    }
    
    @IBAction func playAndStopButton(_ sender: UIButton) {
        print("playAndStopButton be tapped")
    }
    
    //最初の画像を設置するメソッド
    @objc func setImage() {
        
        self.nowImageView.image = self.imageArray[nowIndex]
        print("nowIndex: \(self.nowIndex)")
    }
    
    //次の画像に進むメソッド
    @objc func imageForward() {
        
        self.nowIndex += 1
        
        if (self.nowIndex == self.imageArray.count) {
            self.nowIndex = 0
        }
        
        self.nowImageView.image = self.imageArray[nowIndex]
        print("nowIndex: \(self.nowIndex)")
    }
    
    //前の画像に戻るメソッド
    @objc func imageBackward() {
        
        if (self.nowIndex == 0) {
            self.nowIndex = self.imageArray.count - 1
        } else {
            self.nowIndex -= 1
        }
        
        self.nowImageView.image = self.imageArray[nowIndex]
        print("nowIndex: \(self.nowIndex)")
    }
    

}

