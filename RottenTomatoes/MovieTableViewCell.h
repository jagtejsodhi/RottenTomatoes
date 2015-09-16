//
//  MovieTableViewCell.h
//  RottenTomatoes
//
//  Created by Jagtej Sodhi on 9/15/15.
//  Copyright © 2015 Jagtej Sodhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImagePoster;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;

@end
