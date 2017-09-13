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

@property (weak, nonatomic) IBOutlet UIButton *playerOneCurrentLife;

@property (weak, nonatomic) IBOutlet UIButton *playerTwoCurrentLife;

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
    self.appendUserAnswer = [[NSMutableString alloc]init];
    
    //generate question to user
    self.questionLabelToPlayer.text = self.gameModel.question;
}



- (IBAction)calculatorButtons:(UIButton*)sender {
    //player needs to enter two numbers the two number is appending...
    [self.appendUserAnswer appendFormat:@"%li", (long)sender.tag];
}


- (IBAction)buttonEnter:(UIButton*)sender {
    //after player answer this needs to verify if the answer is correct.
    if ([self.appendUserAnswer intValue] == self.gameModel.correctAnswer){
        self.gameModel.question;
    }
    
    
   
}


@end
