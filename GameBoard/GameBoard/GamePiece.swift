//
//  GamePiece.swift
//  GameBoard
//
//  Created by Jeanie House on 2/18/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

/// Empty = 0, Player1 = 1, Player2 = 2, Player1King = 3, Player2King = 4


enum PieceType: Int {
    
    case Empty
    case Player1
    case Player2
    
    
    case Player1King
    case Player2King
    
}



class GamePiece: UIView {


    var type: PieceType!
    
    init(type: PieceType) {
        
        
        super.init(frame: CGRectMake(0, 0, 20, 20))
        self.type = type
        
        self.backgroundColor = type.hashValue % 2 == 0 ? UIColor.cyanColor() : UIColor.yellowColor()
        layer.cornerRadius = 10
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
  //  override func drawRect(rect: CGRect) {
   //     }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}//End
