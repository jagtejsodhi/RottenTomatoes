//
//  MovieDetailsViewController.m
//  RottenTomatoes
//
//  Created by Jagtej Sodhi on 9/15/15.
//  Copyright © 2015 Jagtej Sodhi. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "UIImageView+AFNetworking.h"


@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *movieName = self.dictionary[@"title"];
    self.movieTitle.text = movieName;
    
    NSString* urlString = self.dictionary[@"posters"][@"detailed"];
    NSURL* url = [NSURL URLWithString:urlString];
    [self.movieImage setImageWithURL:url];
    
    self.synopsis.text = self.dictionary[@"synopsis"];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
