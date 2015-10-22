//
//  MyTableViewController.h
//  CustomCellExample
//
//  Created by Robert Vo on 10/21/15.
//  Copyright © 2015 Robert Vo. All rights reserved.
//

#import <UIKit/UIKit.h>

//Implement the delegates "UITableViewDelegate" and "UITableViewDataSource".
@interface MyTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

//Added a property, listOfAllGames, that will store all of the games to be used.
@property NSMutableArray *listOfAllGames;

- (void)loadAllGamesIntoListOfAllGames;

@end
