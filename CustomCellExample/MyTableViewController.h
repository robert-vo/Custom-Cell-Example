//
//  TheTableViewController.h
//  CustomCellExample
//
//  Created by Robert Vo on 10/21/15.
//  Copyright © 2015 Robert Vo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface MyTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *listOfAllGames;

- (void)loadAllGamesIntoListOfAllGames;

@end
