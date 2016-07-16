//
//  UploadFileCellView.m
//  CloudAlbum
//
//  Created by Recover on 16/7/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "UploadFileCellView.h"

@implementation UploadFileCellView

- (IBAction)copyLinkButtonDidClicked:(id)sender {
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    [pasteboard declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [pasteboard setString:self.linkTextField.stringValue forType:NSStringPboardType];
}

@end
