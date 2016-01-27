//
//  VCEYellowViewController.m
//  ViewControllersFlow
//
//  Created by Developer on 1/26/16.
//  Copyright © 2016 Marcin Małysz. All rights reserved.
//

#import "VCEYellowViewController.h"

@interface VCEYellowViewController ()


@end

@implementation VCEYellowViewController
#define METERS_PER_MILE 1609.344

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.myMapView addAnnotations:[self createAnnotations]];
    [self zoomToLocation];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

    

-(NSMutableArray *)createAnnotations {
    
    NSMutableArray *annontations = [[NSMutableArray alloc]init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Locations" ofType:@"plist"];
    
    NSArray *location = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *row in location) {
        
        NSNumber *latitude = [row objectForKey:@"Latitude"];
        NSNumber *longitude = [row objectForKey:@"Longitude"];
        
        NSString *title = [row objectForKey:@"Title"];
        
        
        CLLocationCoordinate2D cords ;
        cords.latitude = latitude.doubleValue;
        cords.longitude = longitude.doubleValue;
        
    AdressAnnotation *adress = [[AdressAnnotation alloc]initWithTitle:title AndCoordinate:cords];
        [annontations addObject:adress];
    }
    
    
    
    
    
    return annontations;
}
-(void)zoomToLocation {
    
    CLLocationCoordinate2D zoomLocation;
    
    zoomLocation.latitude = 53.0000;
    zoomLocation.longitude = 9.0000;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1000*METERS_PER_MILE, 1000*METERS_PER_MILE);
    [self.myMapView setRegion:viewRegion animated:YES];
    [self.myMapView regionThatFits:viewRegion];
    
    
}

@end
