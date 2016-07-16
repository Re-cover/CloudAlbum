//
//  NSView+BlurView.m
//  CloudAlbum
//
//  Created by Recover on 16/7/16.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "NSView+BlurView.h"

@implementation NSView (BlurView)

- (instancetype)insertVibrancyViewBlendingMode:(NSVisualEffectBlendingMode)mode
{
    Class vibrantClass=NSClassFromString(@"NSVisualEffectView");
    if (vibrantClass)
    {
        NSVisualEffectView *vibrant=[[vibrantClass alloc] initWithFrame:self.bounds];
        [vibrant setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
        [vibrant setBlendingMode:mode];
        [self addSubview:vibrant positioned:NSWindowBelow relativeTo:nil];
        
        return vibrant;
    }
    return nil;
}


@end
