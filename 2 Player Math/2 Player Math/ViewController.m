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

@property (strong, nonatomic)NSMutableString *appendUserAnswer;


@property (strong, nonatomic) GameModel *gameModel;

@property Player *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameModel = [[GameModel alloc]init];
    self.player = [[Player alloc]init];
    //mutablestring for appending answer
//    self.appendUserAnswer = [[NSMutableString alloc]init];
    
    //generate question to user
    self.questionLabelToPlayer.text = [self.gameModel questionForUser];
}


- (IBAction)calculatorButtons:(UIButton*)sender {
    //display user's input
    self.userTyping.text = [self.userTyping.text stringByAppendingString:[NSString stringWithFormat:@"%lu",sender.tag]];
    
//    //player needs to enter two numbers the two number is appending...
//    [self.appendUserAnswer appendFormat:@"%li", (long)sender.tag];
}


- (IBAction)buttonEnter:(UIButton*)sender {
    //after player answer this needs to verify if the answer is correct.
    if ( [self.gameModel compareAnswer:[self.userTyping.text intValue]]) {
        self.displayRightWrong.text = @"Right!";} else{
        self.displayRightWrong.text =@"Wrong!";
            [self.gameModel playerOneLife.
            
            
        
        }
}


@end
