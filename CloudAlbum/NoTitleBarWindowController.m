//
//  NoTitleBarWindowController.m
//  CloudAlbum
//
//  Created by Recover on 16/7/16.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "NoTitleBarWindowController.h"

@implementation NoTitleBarWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    self.window.titleVisibility = NO;
    self.window.titlebarAppearsTransparent = NO;
}

@end
