//
//  GameModel.m
//  2 Player Math
//
//  Created by Paul on 2017-09-12.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "GameModel.h"

@interface GameModel()
@property (nonatomic) NSArray <Player *>*players;
@end

@implementation GameModel

//if I init something its like building an object the array is created and it sees my name and lives.. generally we dont pass through a method but exception  are my generateRandomQuestion cause it has to initalze my property earlier for it to return or else my property would have been nill
-(instancetype)init{
 
    if (self = [super init]){
        [self generateRandomQuestion];
        _playerOne = [[Player alloc]initWithLives:3 name:@"Paul"];
        _playerTwo = [[Player alloc]initWithLives:3 name:@"Simon"];
        _players = @[_playerOne, _playerTwo];
        _index = 0;
        _currentPlayer = _playerOne;
    }
    return self;
}



-(Player *)nextPlayer{
    Player* nextPlayer = self.players[self.index];
    self.index += 1;
    
    if (self.index > self.players.count - 1){
    
        self.index = 0;
    }
    
    return nextPlayer;
}

-(Player *)determineLossLife {
    
    self.currentPlayer = self.players[0];
    
    return self.currentPlayer;
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
    //if i dont add this it gives the same question will appear.. dont assign it to a property because it will never change.
    [self generateRandomQuestion];
    return self.question;
}

-(BOOL)compareAnswer:(NSInteger)answer{
    //compare user's answer on viewController
    
    BOOL correct = self.correctAnswer == answer;
    
    return correct;
}







//created a way to generate next player
//-(int)nextIndex{
//    int turns = self.index % self.players.count;
//    self.index += 1;
//    return turns;
//}

//created array for player
//this method is good if you dont know how many players you have.
//-(Player *)currentPlayer {
//
//  Player *currentPlayer = self.players [[self nextIndex]];
//
//  return currentPlayer;
//}




@end
