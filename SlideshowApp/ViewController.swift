//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 赤津亮太 on 2018/03/17.
//  Copyright © 2018年 Ryota.Akatsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    // 一定の間隔で処理を行うためのタイマーを作成
    var timer: Timer?
    
    // 表示している画像の番号
    var dispImageNo = 0
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "1",
            "2",
            "3",
        ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 3
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 3 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        ImageView.image = image
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let image = UIImage(named: "1")
        ImageView.image = image
        
        // タイマーを設定
        timer = Timer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.onTimer(_:)),userInfo: nil, repeats: true)
      
    }
    
    // NSTimerによって一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func BackButton(_ sender: Any) {
    }
    
    @IBAction func PlayButton(_ sender: Any) {
    }
    
    @IBAction func NextButton(_ sender: Any) {
    }
    
    
}
