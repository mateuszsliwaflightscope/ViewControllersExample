//
//  VCERedViewController.m
//  ViewControllersFlow
//
//  Created by Developer on 1/26/16.
//  Copyright © 2016 Marcin Małysz. All rights reserved.
//

#import "VCERedViewController.h"

@interface VCERedViewController ()

@property (nonatomic , strong) NSArray *arrayOfDate;

@end

@implementation VCERedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfDate = @[@"Berlin" , @"Barcelona" , @"Warszawa" , @"Paryz" , @"Moskwa"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.arrayOfDate count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.arrayOfDate objectAtIndex:indexPath.row];
    return cell;
}
@end
