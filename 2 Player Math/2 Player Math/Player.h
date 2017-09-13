//
//  Player.h
//  2 Player Math
//
//  Created by Paul on 2017-09-12.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GameModel;

@interface Player : NSObject
@property int life;
@property GameModel *gameModel;
@property Player* playerOne;
@property Player* playerTwo;

//player should have an instance method for losing a life.
//-(Player *)playersLives;

@end