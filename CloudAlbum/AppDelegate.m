//
//  AppDelegate.m
//  CloudAlbum
//
//  Created by Recover on 16/7/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [AVOSCloud setApplicationId:@"wyatmm3pwq8RrrvdyJgNuecN-gzGzoHsz"
                      clientKey:@"vvjuRmsq3ce7p5Lash78eadY"];

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
