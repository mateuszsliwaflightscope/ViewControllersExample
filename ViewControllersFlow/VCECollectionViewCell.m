//
//  VCECollectionViewCell.m
//  ViewControllersFlow
//
//  Created by Developer on 1/26/16.
//  Copyright © 2016 Marcin Małysz. All rights reserved.
//

#import "VCECollectionViewCell.h"

@implementation VCECollectionViewCell



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:_imageView];
    }
    return self;
}


- (void)prepareForReuse
{
    [super prepareForReuse];
    
    // reset image property of imageView for reuse
    self.imageView.image = nil;
    
    // update frame position of subviews
    self.imageView.frame = self.contentView.bounds;
}


@end
