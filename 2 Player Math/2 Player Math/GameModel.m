//
//  GameModel.m
//  2 Player Math
//
//  Created by Paul on 2017-09-12.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

-(instancetype)init{
 
    if (self = [super init]){
        [self generateRandomQuestion];
        self.playerOne = [[Player alloc]initWithLives:3];
        self.playerTwo = [[Player alloc]initWithLives:3];
        
    }
    return self;
}


-(void)generateRandomQuestion{
    
    //generate random question
    int question = arc4random_uniform(19)+1;
    int questionTwo = arc4random_uniform(19)+1;
    int answer = question + questionTwo;
    
    self.correctAnswer = answer;
   
    NSString* questionToUser = [NSString stringWithFormat:@"What is %i + %i ?",question,questionTwo];
    
    self.question = questionToUser;
}


-(NSString*)questionForUser{
    return self.question;
}

-(BOOL)compareAnswer:(NSInteger)answer{
    //compare user's answer on viewController
    
    BOOL correct = self.correctAnswer == answer;
    
    return correct;
}

@end
