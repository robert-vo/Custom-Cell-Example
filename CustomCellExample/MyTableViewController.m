//
//  TheTableViewController.m
//  CustomCellExample
//
//  Created by Robert Vo on 10/21/15.
//  Copyright © 2015 Robert Vo. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"
#import "Game.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

@synthesize listOfAllGames;

- (void)viewDidLoad {
    [super viewDidLoad];
    listOfAllGames = [[NSMutableArray alloc] init];
    [self loadAllGamesIntoListOfAllGames];
    static NSString *myCellIdentifier = @"MyCustomCell";
    
    UINib *nib = [UINib nibWithNibName:@"MyCustomCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:myCellIdentifier];

}

- (void)loadAllGamesIntoListOfAllGames {
    Game *game1 = [[Game alloc] init];
    game1.gameTitle = @"Call of Duty";
    game1.gameRating = @"IGN - 9.7/10";
    game1.gameDescription = @"🔫💣🗡🔫💣🗡🔫💣🗡";
    
    Game *game2 = [[Game alloc] init];
    game2.gameTitle = @"Halo 5";
    game2.gameRating = @"Not IGN - 9.9/10";
    game2.gameDescription = @"Master Chief is back at it again.";
    
    Game *game3 = [[Game alloc] init];
    game3.gameTitle = @"League of Legends";
    game3.gameRating = @"5/10";
    game3.gameDescription = @"Online game with lots of fun!";
    
    Game *game4 = [[Game alloc] init];
    game4.gameTitle = @"Super Mario 64";
    game4.gameRating = @"10/10";
    game4.gameDescription = @"Revolutionary 3D game of its time.";
    
    [listOfAllGames addObject:game1];
    [listOfAllGames addObject:game2];
    [listOfAllGames addObject:game3];
    [listOfAllGames addObject:game4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [listOfAllGames count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell" forIndexPath:indexPath];
    Game *thisGame = [listOfAllGames objectAtIndex:indexPath.row];
    
    cell.GameTitleLabel.text = thisGame.gameTitle;
    cell.GameRatingsLabel.text = thisGame.gameRating;
    cell.GameDescriptionLabel.text = thisGame.gameDescription;
    
    return cell;
}

@end
