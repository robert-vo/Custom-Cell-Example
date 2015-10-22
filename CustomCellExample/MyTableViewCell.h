//
//  MyTableViewCell.h
//  CustomCellExample
//
//  Created by Robert Vo on 10/21/15.
//  Copyright © 2015 Robert Vo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *GameTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameRatingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameDescriptionLabel;

@end
