//
//  UploadFileCellView.h
//  CloudAlbum
//
//  Created by Recover on 16/7/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface UploadFileCellView : NSTableCellView

@property (weak) IBOutlet NSImageView *uploadImageView;
@property (weak) IBOutlet NSTextField *linkTextField;
@property (weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (weak) IBOutlet NSButton *button;

@end
