//
//  GameModel.h
//  2 Player Math
//
//  Created by Paul on 2017-09-12.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject
@property int correctAnswer;
@property NSString* question; 


-(void)generateRandomQuestion;


@end