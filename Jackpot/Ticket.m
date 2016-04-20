//
//  Ticket.m
//  Jackpot
//
//  Created by Oliver Short on 4/20/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

#import "Ticket.h"

@interface Ticket () { //parenthesis mean we create something. .m file is private. It isn't a method declaration but an addendum to what we've already declared.
    NSMutableArray *picks;
}



@end


@implementation Ticket

- (instancetype)init
{
    self = [super init];
    if (self) {
        picks = [NSMutableArray array];
        self.winner = NO;
        self.payout = @"";
    }
    return self;
}

+ (instancetype) ticketUsingQuickPick{//a class method has no instance itself. you can't rely on an instance variable already existing
    
    
    Ticket *aTicket = [[Ticket alloc]init];
    
    do {
        [aTicket createPick];
    } while (aTicket.picks.count < 6);
    
    return aTicket;
}

+ (instancetype)ticketUsingArray:(NSArray *)picks{
    Ticket * ticket = [[Ticket alloc]init];
    
    return ticket;
    
}

-(void)storeTheArrayIntoPicks:(NSArray*)array{
    picks = [array mutableCopy];
    
}

-(void) createPick {
    
//      this determines a range for the random numbers
    
    int pickInt = arc4random() % 54 + 1;
    
//      put the int in a container, in this case NSNumber
    
    NSNumber *pickNumber = [NSNumber numberWithInt:pickInt];
    
//      for loop below checks to see if the pickInt  is equal to anything already in the array
    
    BOOL dontAdd = NO;
    for (NSNumber *numberInArray in picks ) {
        if (numberInArray.intValue == pickInt) {
            
//      don't add to array
            
            dontAdd = YES;
        }
    }
    if (!dontAdd) {
        [picks addObject:pickNumber]; //adding the number to the picks array
    }
}

-(NSArray*)picks{
    return [picks copy];
    
//      instance variable is different than the return type. in this case we are returning an array outside people cannot change           as opposed to a mutable array we can change
}

//      creating a method to check our ticket

-(void)compareWithTicket:(Ticket*)anotherTicket{
    NSArray* possibleWinningNumbers = anotherTicket.picks;
    int matchCount=0;
    
    for (NSNumber *ourNumber in picks) {
        for (NSNumber *theirNumber in possibleWinningNumbers) {
            if (ourNumber.integerValue == theirNumber.integerValue) {
                matchCount += 1;
            }
        }
    }
    switch (matchCount) {
            case 1:
            self.winner = YES;
            self.payout = @"$1";
            break;
            
            case 2:
            self.winner = YES;
            self.payout = @"$1";
            break;
            
            case 3:
            self.winner = YES;
            self.payout = @"$5";
            break;
            
            case 4:
            self.winner = YES;
            self.payout = @"$10";
            break;
            
            case 5:
            self.winner = YES;
            self.payout = @"$100";
            break;
            
            case 6:
            self.winner = YES;
            self.payout = @"$1000";
            break;
            
        default:
            self.payout  = @"Sorry please play again";
            break;
    }
}

-(NSString*)description{
    return [NSString stringWithFormat: @"%@ %@ %@ %@ %@ %@", picks[0], picks [1], picks[2], picks[3],picks[4],picks [5] ];
}

            
@end
