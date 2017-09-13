//
//  Player.m
//  2 Player Math
//
//  Created by Paul on 2017-09-12.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "Player.h"
#import "GameModel.h"

@implementation Player

-(instancetype)initWithLives:(int)life{

    self = [super init];
    
    if (self){
        _playerOneLife = life;
        _playerTwoLife = life;
    
    }
    return self;
}





@end
