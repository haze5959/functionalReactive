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

//버튼 누를 때 마다 수행할 작업
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

//룰렛 숫자들
let slotItems:[String] = ["1",
                          "2",
                          "3",
                          "4",
                          "5",
                          "6",
                          "7",
                          "8",
                          "9",
                          "♥️",
                          "♣️",
                          "♠️"];

class slotFactory {
    var slotObserver:Observable<Int>;
    var disposeBag:DisposeBag;
    var slotLabel:UILabel;
    
    var disposable:Disposable?; //구독 되고 있는 걸 저장
    
    init(_ observable:Observable<Int>, _ disposeBag:DisposeBag, _ slotLabel:UILabel) {
        self.slotObserver = observable;
        self.disposeBag = disposeBag;
        self.slotLabel = slotLabel;
    }
    
    func start() -> Void {
        self.disposable = self.slotObserver.map{value in return value}
                    .subscribe(onNext:{
                        value in
                        self.slotLabel.text = slotItems[value % slotItems.count];
                    });
    }
    
    func stop() -> Void {
        self.disposable?.dispose();
    }
}



class SlotMachineViewController: UIViewController {

    @IBOutlet weak var slotLb_1: UILabel!
    @IBOutlet weak var slotLb_2: UILabel!
    @IBOutlet weak var slotLb_3: UILabel!
    @IBOutlet weak var resultLb: UILabel!
    @IBOutlet weak var switchBtn: UIButton!
    
    let SlotObservable = Observable<Int>.interval(0.1, scheduler: MainScheduler.instance);
    let disposeBag = DisposeBag();
    var gameStep = GAME_STEP.IDLE;
    var slot1:slotFactory!;
    var slot2:slotFactory!;
    var slot3:slotFactory!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.slotLb_1.text = "7";
        self.slotLb_2.text = "7";
        self.slotLb_3.text = "7";
        self.resultLb.text = "스위치를 누르면 슬롯이 돌아갑니다~";
        
        //버튼 동작
        self.switchBtn.addTarget(self, action: #selector(pressSwitchBtn), for:UIControlEvents.touchUpInside);
        
        self.slot1 = slotFactory.init(self.SlotObservable, self.disposeBag , self.slotLb_1);
        self.slot2 = slotFactory.init(self.SlotObservable, self.disposeBag , self.slotLb_2);
        self.slot3 = slotFactory.init(self.SlotObservable, self.disposeBag , self.slotLb_3);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 스위치버튼 눌렀을 때 동작
    func pressSwitchBtn() -> Void {
        NSLog("되냐? %d", self.gameStep.rawValue);
        self.gameStep.goNext(); //다음 단계로 넘김
        
        switch self.gameStep {
        case .IDLE:
            self.slotLb_1.text = "7";
            self.slotLb_2.text = "7";
            self.slotLb_3.text = "7";
            self.resultLb.text = "스위치를 누르면 슬롯이 돌아갑니다~";
            break;
        case .SLOT1_SPIN:
//            startSlot.map{value in return value}.subscribe(onNext:{
//                value in
//                self.slotLb_1.text = self.slotItems[value % self.slotItems.count];
//            }).addDisposableTo(disposeBag);
            self.slot1.start();
            break;
        case .SLOT2_SPIN:
//            startSlot.map{value in return value}.subscribe(onNext:{
//                value in
//                self.slotLb_2.text = self.slotItems[value % self.slotItems.count];
//            }).addDisposableTo(disposeBag); Remaining
            self.slot2.start();
            break;
        case .SLOT3_SPIN:
//            var ddd:Observable = startSlot.map{value in return value}.subscribe(onNext:{
//                value in
//                self.slotLb_3.text = self.slotItems[value % self.slotItems.count];
//            }).addDisposableTo(disposeBag);
            self.slot3.start();
            break;
        case .SLOT1_STOP:
            self.slot1.stop();
            break;
        case .SLOT2_STOP:
            self.slot2.stop();
            break;
        case .SLOT3_STOP:
            self.slot3.stop();
            self.gameStep = .IDLE;
            break;
            
        }
    }

}
