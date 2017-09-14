//
//  ViewController.m
//  2 Player Math
//
//  Created by Paul on 2017-09-12.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabelToPlayer;

@property (weak, nonatomic) IBOutlet UILabel *playerOneGameLife;

@property (weak, nonatomic) IBOutlet UILabel *playerTwoGameLife;


@property (weak, nonatomic) IBOutlet UILabel *userTyping;

@property (weak, nonatomic) IBOutlet UILabel *displayRightWrong;


@property (weak, nonatomic) IBOutlet UILabel *showPlayerTurn;

@property (strong, nonatomic) GameModel *gameModel;

@property (nonatomic) Player* player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameModel = [[GameModel alloc]init];
    
    //making this global now this method can be used everywhere with the property class player. this is basically a variable now so it changes between p1 and p2 because of the method.
    self.player = [self.gameModel nextPlayer];

    //generate question to user
    self.questionLabelToPlayer.text = [self.gameModel questionForUser];
    
    //generate player one life as text
    self.playerOneGameLife.text = [NSString stringWithFormat:@"%d", self.gameModel.playerOne.numberOfLives];
   
    //generate player two life as NSnumber.stringvalue because outlet doesnt take text
    self.playerTwoGameLife.text = @(self.gameModel.playerTwo.numberOfLives).stringValue;
    
    self.showPlayerTurn.text = self.player.name;
    
}


- (IBAction)calculatorButtons:(UIButton*)sender {
    //display user's input and append the two input to compare to answer
    self.userTyping.text = [self.userTyping.text stringByAppendingString:[NSString stringWithFormat:@"%lu",sender.tag]];
    
}


- (IBAction)buttonEnter:(UIButton*)sender {
    
    
    //after player answer this needs to verify if the answer is correct.
    if ([self.gameModel compareAnswer:[self.userTyping.text intValue]]) {

         self.displayRightWrong.text = @"Right!";
         self.questionLabelToPlayer.text = [self.gameModel questionForUser]; //generate question
        
        
        self.player = [self.gameModel nextPlayer];//sets the self.player as a holder for nextPlayer.
        self.showPlayerTurn.text = self.player.name;
        
        
        
        //makes an empty string after user clicks enter
        self.userTyping.text = [self.userTyping.text stringByReplacingOccurrencesOfString:self.userTyping.text withString:@" "];

    }else{
        
        self.displayRightWrong.text =@"Wrong!";
        //have to declare again because my nextplayer wont be called because if the "if" is triggered code stops. I could put it outside my if/else function to make it work..
        
        
        //decreases the player's life. self.player is a variable holding the method that changes the players therefore it can be compared to playerOne.
        
        if (self.player == self.gameModel.playerOne) {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            NSInteger life = [formatter numberFromString:self.playerOneGameLife.text].integerValue - 1;
            
            self.playerOneGameLife.text = [@(life) stringValue];
        }
        else {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            NSInteger life = [formatter numberFromString:self.playerTwoGameLife.text].integerValue - 1;
            
            self.playerTwoGameLife.text = [@(life) stringValue];
        }
        
        
        //Treat self.player as a variable because it holds the method being called. Therefore it changes between player one and two
        self.player = [self.gameModel nextPlayer];
        self.showPlayerTurn.text = self.player.name;
        
        
        
        
        //makes an empty string after user clicks enter. Need to declare here too because "if" statement hits it will never hit else.
        self.userTyping.text = [self.userTyping.text stringByReplacingOccurrencesOfString:self.userTyping.text withString:@" "];
        }
    
}


@end
