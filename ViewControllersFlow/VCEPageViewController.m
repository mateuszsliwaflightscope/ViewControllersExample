//
//  PageViewController.m
//  ViewControllersFlow
//
//  Created by Marcin Pędzimąż on 25.01.2016.
//  Copyright © 2016 Marcin Małysz. All rights reserved.
//

#import "VCEPageViewController.h"

@interface VCEPageViewController () <UIPageViewControllerDataSource>
@property (nonatomic, strong) NSMutableArray *colorItems;
@property (nonatomic, strong) NSMutableDictionary *cacheDictionary;
@end

@implementation VCEPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorItems = [NSMutableArray array];
    
    for (int i = 0; i<10; i++) {
        
        [self.colorItems addObject:[UIColor colorWithRed:((CGFloat)(arc4random()%255)/255.0)
                                                   green:((CGFloat)(arc4random()%255)/255.0)
                                                    blue:((CGFloat)(arc4random()%255)/255.0)
                                                   alpha:1.0]];
        
    }
    
    UIPageControl *pageIndicator = [UIPageControl appearanceWhenContainedInInstancesOfClasses:@[[UIPageViewController class]]];
    
    pageIndicator.pageIndicatorTintColor = [UIColor grayColor];
    pageIndicator.currentPageIndicatorTintColor = [UIColor whiteColor];

    [self reloadCache];

    self.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    [self reloadCache];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self loadFirstController];
}

- (void)reloadCache {

    self.cacheDictionary = [NSMutableDictionary dictionary];
}

- (void)loadFirstController {
    
    UIViewController *first = [self viewControllerWithIndex:0];
   
    [self setViewControllers:@[first]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
}

- (UIViewController *)viewControllerWithIndex:(NSInteger)index {

    UIViewController *cachedController = self.cacheDictionary[@(index)];
    
    if (cachedController != nil) {
    
        return  cachedController;
    }
    
    cachedController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    cachedController.view.backgroundColor = self.colorItems[index];

    //NO Don't do this like that it's only for the sake of example! :D
    //http://doing-it-wrong.mikeweller.com/2012/08/youre-doing-it-wrong-4-uiview.html
    
    cachedController.view.tag = index;
    
    self.cacheDictionary[@(index)] = cachedController;
    
    return cachedController;
}

#pragma mark - <UIPageViewControllerDataSource>

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    NSInteger index = viewController.view.tag;
    
    [self manageNavigationBar:index];
    
    index--;
    
    if (index < 0) {
    
        return nil;
    }
    
    return [self viewControllerWithIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {

    NSInteger index = viewController.view.tag;
    
    [self manageNavigationBar:index];
    
    index++;
    
    if (index >= self.colorItems.count) {
    
        return nil;
    }
    
    return [self viewControllerWithIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    
    return self.colorItems.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {

    UIViewController *currentController = [pageViewController.viewControllers firstObject];

    return currentController.view.tag;
}

- (void)manageNavigationBar:(NSInteger)index {
    
    if (index == 0 || index == 9) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }

}

@end
