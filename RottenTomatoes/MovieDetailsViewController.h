//
//  MovieDetailsViewController.h
//  RottenTomatoes
//
//  Created by Jagtej Sodhi on 9/15/15.
//  Copyright © 2015 Jagtej Sodhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *synopsis;
@property (strong, nonatomic) NSDictionary* dictionary;

@end
