//
//  AdressAnnotation.h
//  ViewControllersFlow
//
//  Created by Developer on 1/27/16.
//  Copyright © 2016 Marcin Małysz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface AdressAnnotation : NSObject <MKAnnotation>

@property (nonatomic,copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(id) initWithTitle:(NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate;



@end
