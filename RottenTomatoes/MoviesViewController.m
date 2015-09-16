//
//  MoviesViewController.m
//  RottenTomatoes
//
//  Created by Jagtej Sodhi on 9/15/15.
//  Copyright © 2015 Jagtej Sodhi. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "MovieDetailsViewController.h"

@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;
@property (strong, nonatomic) NSDictionary *dictionary;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;



@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.moviesTableView insertSubview:self.refreshControl atIndex:0];
    
    self.moviesTableView.delegate = self;
    self.moviesTableView.dataSource = self;
    
    [self.spinner startAnimating];
    
    NSURL *url = [NSURL URLWithString: @ "https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"%@", self.dictionary);
        
        [self.moviesTableView reloadData];
        
        [self.spinner stopAnimating];
    }];
}

- (void) onRefresh {
    NSURL *url = [NSURL URLWithString: @ "https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"%@", self.dictionary);
        
        [self.moviesTableView reloadData];
        
        [self.refreshControl endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dictionary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"com.jagtej.sodhi.moviecell" forIndexPath:indexPath];
    
    NSString *movieName = self.dictionary[@"movies"][indexPath.row][@"title"];
    NSLog(@"Movie name: %@", movieName);
    
    NSString* urlString = self.dictionary[@"movies"][indexPath.row][@"posters"][@"detailed"];
    NSURL* url = [NSURL URLWithString:urlString];
    
    cell.movieTitle.text = movieName;
    [cell.movieImagePoster setImageWithURL:url];
    
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    MovieDetailsViewController* detailsController = [segue destinationViewController];
    NSIndexPath* indexPath = [self.moviesTableView indexPathForCell:sender];
    
    detailsController.dictionary = self.dictionary[@"movies"][indexPath.row];
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
