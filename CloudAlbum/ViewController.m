//
//  ViewController.m
//  CloudAlbum
//
//  Created by Recover on 16/7/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "ViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "UploadFileCellView.h"
#import "UploadFileModel.h"
#import "NSView+BlurView.h"

@interface ViewController()

@property (weak) IBOutlet NSTableView *tableView;

@property (nonatomic, strong) NSOpenPanel *panel;

@property (nonatomic, strong) NSMutableArray<UploadFileModel *> *data;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView insertVibrancyViewBlendingMode:NSVisualEffectBlendingModeBehindWindow];
    [self.view insertVibrancyViewBlendingMode:NSVisualEffectBlendingModeBehindWindow];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.data.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = @"UploadFileCellView";
    UploadFileCellView *cell = [tableView makeViewWithIdentifier:identifier owner:nil];
    [cell.uploadImageView setImage: self.data[row].image];
    cell.linkTextField.stringValue = self.data[row].linkString == nil ? @"": self.data[row].linkString;
    cell.progressIndicator.doubleValue = self.data[row].progress;
    cell.button.hidden = self.data[row].isSucceeded ? FALSE : TRUE;
    cell.progressIndicator.hidden = self.data[row].isSucceeded ? TRUE: FALSE;
    return cell;
}

- (IBAction)uploadButtonDidClicked:(id)sender {
    __weak typeof(self) weakSelf = self;
    [self.panel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result) {
        NSURL *url;
        for (url in self.panel.URLs) {
            UploadFileModel *model = [[UploadFileModel alloc] init];
            model.image = [[NSImage alloc] initWithContentsOfURL:url];
            [self.data addObject: model];
            NSUInteger index = self.data.count - 1;
            
            NSString *filePath = url.relativePath;
            NSString *fileName = url.relativePath.lastPathComponent;
            AVFile *file = [AVFile fileWithName:fileName contentsAtPath:filePath];
            
            [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if(succeeded) {
                    self.data[index].linkString = file.url;
                    self.data[index].isSucceeded = TRUE;
                    [weakSelf.tableView reloadData];
                } else {
                    self.data[index].linkString = error.description;
                    self.data[index].isSucceeded = FALSE;
                    [weakSelf.tableView reloadData];
                }
                
            } progressBlock:^(NSInteger percentDone) {
                self.data[index].progress = percentDone;
                [weakSelf.tableView reloadData];
            }];
        }
    }];
}

- (NSOpenPanel *)panel {
    if (!_panel) {
        self.panel = [NSOpenPanel openPanel];
        self.panel.allowedFileTypes = [NSImage imageTypes];
        self.panel.allowsMultipleSelection = YES;
        self.panel.prompt = @"上传";
    }
    return _panel;
}

- (NSMutableArray<UploadFileModel *> *)data {
    if (!_data) {
        self.data = [[NSMutableArray alloc] init];
    }
    return _data;
}

@end
