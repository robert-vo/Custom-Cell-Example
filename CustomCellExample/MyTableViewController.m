//
//  MyTableViewController.m
//  CustomCellExample
//
//  Created by Robert Vo on 10/21/15.
//  Copyright © 2015 Robert Vo. All rights reserved.
//

#import "MyTableViewController.h"

//This import allows us to create the MyTableViewCell object, which is the custom cell.
#import "MyTableViewCell.h"

//Used to create a Game object.
#import "Game.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

@synthesize listOfAllGames;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Merely initializing the array. The array is mutable since we are adding objects to it one at a time.
    listOfAllGames = [[NSMutableArray alloc] init];
    
    self.navigationController.topViewController.title = @"🎮🎮🎮🎮🎮Games🎮🎮🎮🎮🎮";

    [self loadAllGamesIntoListOfAllGames];
    
    
    /* You need a cell identifier for your custom cell so that your app will know which custom cell to load.
     * Think of it as loading views using the segue identifier.
     * This identifier is a custom made string located in:
     * MyCustomCell.xib -> Attributes inspector -> Identifier
     */
    static NSString *myCellIdentifier = @"MyCustomCell";
    UINib *nib = [UINib nibWithNibName:@"MyCustomCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:myCellIdentifier];
    
    //Code needed to add left and right swipe gesture recognizers on the table.
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(leftSwipe:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.tableView addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                           action:@selector(rightSwipe:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.tableView addGestureRecognizer:recognizer];

}

- (void)leftSwipe:(UISwipeGestureRecognizer *)gestureRecognizer
{
    NSString *alertMessage = @"You have swiped left!";
    
    //Prepares and displays alert.
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Left!"
                                message: alertMessage
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okayButton = [UIAlertAction
                                 actionWithTitle:@"Okay"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     //The alert is dismisses when the user hits "Okay".
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
    [alert addAction:okayButton];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)rightSwipe:(UISwipeGestureRecognizer *)gestureRecognizer
{
    NSString *alertMessage = @"You have swiped right! This game entry will now be deleted. 😱😢";
    
    //Prepares and displays alert.
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"DELETED!"
                                message: alertMessage
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okayButton = [UIAlertAction
                                 actionWithTitle:@"Okay"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     //The alert is dismisses when the user hits "Okay".
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
    [alert addAction:okayButton];
    [self presentViewController:alert animated:YES completion:nil];

    
    CGPoint location = [gestureRecognizer locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    [listOfAllGames removeObject:[listOfAllGames objectAtIndex:indexPath.row]];
    [self.tableView reloadData];
}



//Creates Game objects and sets the attributes of the Game objects.
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

//This method creates the number of rows in the table view.
-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return MAX([listOfAllGames count], 1);
}

//Keep it at 1.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//Sets the height, in points, of our custom cell in the row.
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125;
}

/* Again, similar to the segue transitions, you need to create the cell object that you are loading.
 * This is respect to your identifier, which was defined earlier.
 * Once that has been done, you can simply set the fields of the Custom Cell to your needs.
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell" forIndexPath:indexPath];
    
    if([listOfAllGames count] > 0) {
        Game *thisGame = [listOfAllGames objectAtIndex:indexPath.row];
        cell.GameTitleLabel.text = thisGame.gameTitle;
        cell.GameRatingsLabel.text = thisGame.gameRating;
        cell.GameDescriptionLabel.text = thisGame.gameDescription;
    }
    else {
        cell.GameTitleLabel.text = @"Nothing :(";
        cell.GameRatingsLabel.text = @"Nothing :(";
        cell.GameDescriptionLabel.text = @"Nothing :(";

    }
    return cell;
}

@end
