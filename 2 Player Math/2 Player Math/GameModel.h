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

@property (nonatomic) int correctAnswer;
@property (nonatomic,strong) NSString* question;
@property (nonatomic, strong) Player* playerOne;
@property (nonatomic, strong) Player* playerTwo;
@property (nonatomic, strong) Player* currentPlayer;
@property (nonatomic) int index;



-(BOOL)compareAnswer:(NSInteger)answer;
-(void)generateRandomQuestion;
-(NSString*)questionForUser;
-(Player *)nextPlayer;
-(Player *)determineLossLife;

@end
