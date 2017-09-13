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

@property int numberOfLives;

//player should have an instance method for losing a life.
-(instancetype)initWithLives:(int)life;


@end
