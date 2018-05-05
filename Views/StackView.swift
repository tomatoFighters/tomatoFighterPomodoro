//
//  StackView.swift
//  Times
//
//  Created by Veronika Kotckovich on 5/5/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import UIKit

class StackView: UIView {
    
    var name: UILabel?
    var time: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        name = UILabel(frame: CGRect(x: 30, y: self.frame.height/2, width: 250, height: 21))
        name?.textAlignment = .left
        
        time = UILabel(frame: CGRect(x: self.frame.width-80, y: self.frame.height/2, width: 50, height: 21))
        time?.textAlignment = .right
        
        self.addSubview(name!)
        self.addSubview(time!)
    }
    
//    override func draw(_ rect: CGRect) {
//        name = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        name?.textAlignment = .center
//        //name?.text = "HELLO"
//
//        time = UILabel(frame: CGRect(x: 150, y: 0, width: 200, height: 21))
//        time?.textAlignment = .center
//        //time?.text = "I AM HERE"
//
//        self.addSubview(name!)
//        self.addSubview(time!)
//    }
//

}
