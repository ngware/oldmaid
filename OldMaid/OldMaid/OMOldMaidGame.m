//  Created by Nicolas on 12/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import "OMOldMaidGame.h"
#import "OMDeck.h"
#import "OMCard.h"
#import "OMOldMaidHand.h"

@implementation OMOldMaidGame

-(void)playWithPlayers:(NSArray *)names {
    
    NSLog(@"-------------- %@ started", NSLocalizedString(@"TITLE", nil));
    NSLog(@"-------------- %@ started", NSLocalizedString(@"ISEMPTY", nil));
    // remove Queen of clubs
    //NSLog(@"First Deck:\n%@", [[self deck] description]);
    OMCard *drQueenFemmeMedecin = [[OMCard alloc] initWithSuit:0 andRank:12];
    [[self deck] removeCard:drQueenFemmeMedecin];
    
    //NSLog(@"Deck without queen of Clubs:\n%@", [[self deck] description]);
    
    
    // make a hand for each players
    _hands = [[NSMutableArray alloc] init];
    
    for (NSString *name in names) {
        OMOldMaidHand *newHand = [[OMOldMaidHand alloc] initWithName:name];
        [_hands addObject:newHand];
    }
    
    [self printHands];
    
    //deal the cards
    [[self deck] dealAllCards:_hands];
    NSLog(@"-------------- Cards have been dealt");
    [self printHands];
    
    // remove initial matches
    NSInteger matches = [self removeAllMatches];
    [self printHands];
    NSLog(@"-------------- Matches discarded (%d), play begins",  matches);
    
    
    // play until all 50 cards are matched
    NSInteger turn = 0;
    NSInteger nbHands = [_hands count];
    
    while (matches < 25) {
        matches = matches + [self playOneTurn:turn];
        turn = (turn + 1) % nbHands;
    }
    
    NSLog(@"-------------- Game is Over");
    [self printHands];
    //*/
}

-(NSInteger)removeAllMatches {
    
    NSInteger count = 0;
    
    for (OMOldMaidHand *hand in _hands) {
        count += [hand removeMatches];
    }
    return count;
}

-(void)printHands {
    
    for (OMOldMaidHand *hand in _hands) {
        NSLog(@"%@", [hand description]);
    }
}

-(NSInteger)playOneTurn:(NSInteger)idPlayer {
    
    NSInteger count = 0;
    
    if (!([[_hands objectAtIndex:idPlayer] isEmpty])) {
        
        NSInteger neighbor = [self findNeighbor:idPlayer];
        OMCard *pickedCard = [[_hands objectAtIndex:neighbor] popCard];
        [[_hands objectAtIndex:idPlayer] addCard:pickedCard];
        
        NSLog(@"Hand %@ picked %@", [[_hands objectAtIndex:idPlayer] name], [pickedCard description]);
        
        count = [[_hands objectAtIndex:idPlayer] removeMatches];
        [[_hands objectAtIndex:idPlayer] shuffle];
    }
    return count;
}

-(NSInteger)findNeighbor:(NSInteger)idPlayer {
    
    NSInteger neighbor = -1, nbHands = [_hands count];
    
    for (int next = 1; next < nbHands; next++ ) {
        
        neighbor = (idPlayer + next) % nbHands;
        if (![[_hands objectAtIndex:neighbor] isEmpty]) {
            return neighbor;
        }
    }
    // we should never reach this line
    return neighbor;
}
@end
