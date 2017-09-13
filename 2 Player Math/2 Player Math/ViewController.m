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

//@property Player *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameModel = [[GameModel alloc]init];
//    self.player = [[Player alloc]init];
    
    //generate question to user
    self.questionLabelToPlayer.text = [self.gameModel questionForUser];
    
    //generate player one life as text
    self.playerOneGameLife.text = [NSString stringWithFormat:@"%d", self.gameModel.playerOne.numberOfLives];
   
    //generate player two life as string string value because outlet doesnt take text
    self.playerTwoGameLife.text = @(self.gameModel.playerTwo.numberOfLives).stringValue;
}


- (IBAction)calculatorButtons:(UIButton*)sender {
    //display user's input and append the two input to compare to answer
    self.userTyping.text = [self.userTyping.text stringByAppendingString:[NSString stringWithFormat:@"%lu",sender.tag]];
}


- (IBAction)buttonEnter:(UIButton*)sender {
    //after player answer this needs to verify if the answer is correct.
    if ([self.gameModel compareAnswer:[self.userTyping.text intValue]]) {
         self.displayRightWrong.text = @"Right!";
        [self.gameModel questionForUser];
        self.playerOneGameLife 
        
        
    }else{
        self.displayRightWrong.text =@"Wrong!";
        }
}


@end
