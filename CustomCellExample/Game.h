//Plain old game object with a title, rating, and description.

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property NSString *gameTitle;
@property NSString *gameRating;
@property NSString *gameDescription;

@end
