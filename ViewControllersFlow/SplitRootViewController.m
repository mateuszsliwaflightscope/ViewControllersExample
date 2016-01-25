//
//  SplitRootViewController.m
//  ViewControllersFlow
//
//  Created by Marcin Pędzimąż on 25.01.2016.
//  Copyright © 2016 Marcin Małysz. All rights reserved.
//

#import "SplitRootViewController.h"
#import "SplitDetailViewController.h"

@interface SplitRootViewController ()
@property (nonatomic, strong) NSArray *items;
@end

@implementation SplitRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                          target:self
                                                                                          action:@selector(dismissViewController)];
    
    self.items = @[@"First", @"Second", @"Third", @"Fourth", @"Fifth"];
    
}

- (void)dismissViewController {
    
    [self.splitViewController dismissViewControllerAnimated:YES
                                                 completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *path = (NSIndexPath *)sender;
    
    if ([segue.identifier isEqualToString:@"showSegue"] == YES) {
        
        SplitDetailViewController *detail = (SplitDetailViewController*)segue.destinationViewController;
        
        __unused UIView *loadView = detail.view;
        
        detail.detailInfoLabel.text = self.items[path.row];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger count = self.splitViewController.viewControllers.count;
    
    if (count == 1) {
   
        [self performSegueWithIdentifier:@"showSegue" sender:indexPath];
        
        return;
    }
    
    SplitDetailViewController *detail = (SplitDetailViewController*)self.splitViewController.viewControllers.lastObject;
    
    detail.detailInfoLabel.text = self.items[indexPath.row];
}

@end
