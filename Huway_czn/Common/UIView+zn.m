//
// Created by Huway Mac on 15/11/20.
// Copyright (c) 2015 Android Develope. All rights reserved.
//

#import "UIView+zn.h"


@implementation UIView (zn)

- (void)zn_roundCornerWithRadius:(CGFloat)radius {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = radius;
}

@end