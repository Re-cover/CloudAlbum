//
//  UploadFileModel.h
//  CloudAlbum
//
//  Created by Recover on 16/7/10.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadFileModel : NSObject

@property (strong) NSImage *image;

@property (copy) NSString *linkString;

@property (assign) NSInteger progress;

@property (assign) BOOL isSucceeded;

@end
