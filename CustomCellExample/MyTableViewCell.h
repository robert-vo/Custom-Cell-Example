//This is for MyCustomCell.xib.
//This is needed so the labels in the custom cell can be changed.

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *GameTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameRatingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameDescriptionLabel;

@end
