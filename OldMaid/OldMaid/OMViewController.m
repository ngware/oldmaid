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
#import "OMOldMaidHand.h";

@interface OMViewController ()

@end

@implementation OMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    OMCard *card = [[OMCard alloc] init];
    //NSLog(@"1: %@", card.description);
    
    OMCard *card2 = [[OMCard alloc] initWithSuit:2 andRank:1];
    //NSLog(@"2: %@", card2.description);
    
    OMCard *card3 = [[OMCard alloc] initWithSuit:18];
    //NSLog(@"3: %@", card3.description);
    
    OMCard *card4 = [[OMCard alloc] initWithSuit:2 andRank:1];
    //NSLog(@"4: %@", card4.description);
    /*
     if([card2 isEqual:card4])
     NSLog(@"2 is Equal to 4");
     
     if([card2 compare:card2] == 0)
     NSLog(@"2 is the same as to 2");
     
     if([card2 compare:card4] == 0)
     NSLog(@"2 is the same as to 4");
     //*/
    OMDeck *deck = [[OMDeck alloc] init];
    //NSLog(@"%@", [deck description]);
    /*
     [deck shuffle];
     NSLog(@"########################");
     NSLog(@"%@", [deck description]);
     
     [deck removeCard:[[deck cards] objectAtIndex:0]];
     NSLog(@"########################");
     NSLog(@"%@", [deck description]);
     
     OMCard * card5 = [deck popCard];
     NSLog(@"########################");
     NSLog(@"%@ \n>%@", [deck description], card5);
     
     [deck emptyDeck];
     
     if([deck isEmpty])
     NSLog(@"Deck is empty");
     else
     NSLog(@"Deck is not empty");
     
     [deck fillDeck];
     if([deck isEmpty])
     NSLog(@"Deck is empty");
     else
     NSLog(@"Deck is not empty");
     //*/
    
    [deck shuffle];
    OMHand *hand = [[OMHand alloc] initWithName:@"Franck"];
    OMHand *hand2 = [[OMHand alloc] initWithName:@"Bob"];
    NSArray *handArray = [[NSArray alloc] initWithObjects:hand, hand2, nil];
    [deck dealNCards:9 toHands: handArray];
    NSLog(@"%@", hand.description);
    NSLog(@"%@", hand2.description);
    
    NSLog(@"###############\n");
    
    OMCardGame *game = [[OMCardGame alloc] init];
    OMOldMaidHand *hand3 = [[OMOldMaidHand alloc] initWithName:@"Franck"];
    NSArray *handArray2 = [[NSArray alloc] initWithObjects:hand3, nil];
    [[game deck] dealNCards:13 toHands:handArray2];
    NSLog(@"%@", [hand3 description]);
    
    [hand3 removeMatches];
    NSLog(@"%@", [hand3 description]);
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
