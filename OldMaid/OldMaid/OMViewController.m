//
//  OMViewController.m
//  OldMaid
//
//  Created by Nicolas on 07/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import "OMViewController.h"
#import "OMCard.h"
#import "OMDeck.h"
#import "OMHand.h"
#import "OMCardGame.h"
#import "OMOldMaidHand.h"
#import "OMOldMaidGame.h"

@interface OMViewController ()

@end

@implementation OMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
        
    OMOldMaidGame *game = [[OMOldMaidGame alloc] init];
    [game playWithPlayers:[NSArray arrayWithObjects:@"Allen", @"Jeff", nil]];    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
