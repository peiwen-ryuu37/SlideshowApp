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
    
    //タイマー
    var timer: Timer!
    
    //タイマー用の時間のための変数
    var timer_sec: Int = 0
    
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

    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var playAndStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //最初の画像設置
        self.setImage()
    }
    
    //segueが動作することをViewControllerに通知する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextViewSegue" {
            let nextViewController = segue.destination as! NextViewController
            nextViewController.selectedImage = self.imageArray[self.nowIndex]
        }
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
        
        if playAndStopButton.titleLabel?.text == "再生" {
            playAndStopButton.setTitle("停止", for: .normal)
            forwardButton.isEnabled = false
            backwardButton.isEnabled = false
            
            //タイマーを開始
            self.startTimer()
            
        } else {
            playAndStopButton.setTitle("再生", for: .normal)
            forwardButton.isEnabled = true
            backwardButton.isEnabled = true
            
            //タイマーを停止
            self.stopTimer()
        }
    }
    
    //画像をタップする時の画面遷移実行
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "nextViewSegue", sender: nil)
        
        //自動送り中に画面遷移して、戻ってくると停止する
        playAndStopButton.setTitle("再生", for: .normal)
        forwardButton.isEnabled = true
        backwardButton.isEnabled = true
        self.stopTimer()
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
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
    
    //タイマー開始
    @objc func startTimer() {
        if self.timer == nil {
            self.timer_sec = 0
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateImage(_:)), userInfo: nil, repeats: true)
        }
    }
    
    //タイマー停止
    @objc func stopTimer() {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    //タイマー更新
    @objc func updateImage(_ timer: Timer) {
        self.timer_sec += 2
        print("timer: \(self.timer_sec)")
        self.imageForward()
    }
    

}

