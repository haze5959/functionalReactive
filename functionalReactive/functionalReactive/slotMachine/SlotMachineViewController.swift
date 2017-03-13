//
//  SlotMachineViewController.swift
//  functionalReactive
//
//  Created by 권오규 on 2017. 3. 10..
//  Copyright © 2017년 권오규. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


enum GAME_STEP:Int {
    case IDLE = 0
    case SLOT1_SPIN
    case SLOT2_SPIN
    case SLOT3_SPIN
    case SLOT1_STOP
    case SLOT2_STOP
    case SLOT3_STOP
    
    mutating func goNext() -> Void {
        self = GAME_STEP.init(rawValue: self.rawValue + 1)!;
    }
}
class SlotMachineViewController: UIViewController {

    @IBOutlet weak var slotLb_1: UILabel!
    @IBOutlet weak var slotLb_2: UILabel!
    @IBOutlet weak var slotLb_3: UILabel!
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var switchBtn: UIButton!
    
    var gameStep = GAME_STEP.IDLE;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.slotLb_1.text = "7";
        self.slotLb_2.text = "7";
        self.slotLb_3.text = "7";
        self.resultLb.text = "스위치를 누르면 슬롯이 돌아갑니다~";
        
        self.switchBtn.addTarget(self, action: #selector(pressSwitchBtn), for:UIControlEvents.touchUpInside);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressSwitchBtn() -> Void {
        NSLog("되냐? %d", self.gameStep.rawValue);
        self.gameStep.goNext(); //다음 단계로 넘김
        
        switch self.gameStep {
        case .IDLE:
            break;
        case .SLOT1_SPIN:
            break;
        case .SLOT2_SPIN:
            break;
        case .SLOT3_SPIN:
            break;
        case .SLOT1_STOP:
            break;
        case .SLOT2_STOP:
            break;
        case .SLOT3_STOP:
            self.gameStep = .IDLE;
            break;
            
        }
    }

}
