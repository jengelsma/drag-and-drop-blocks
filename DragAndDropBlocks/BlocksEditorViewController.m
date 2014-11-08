//
//  ViewController.m
//  DragAndDropBlocks
//
//  Created by Jonathan Engelsma on 11/7/14.
//  Copyright (c) 2014 Jonathan Engelsma. All rights reserved.
//

#import "BlocksEditorViewController.h"

@interface BlocksEditorViewController ()
{
    UIButton *currentButton;
}
@end

@implementation BlocksEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) imageTouch:(UIButton*) sender withEvent:(UIEvent *) event
{
    // source buttons (e.g. ones that stay in place on the bottom are tagged 99).
    if(sender.tag == 99) {
        currentButton = [[UIButton alloc] initWithFrame:sender.frame];
        currentButton.tag = 0;
        currentButton.backgroundColor = sender.backgroundColor;
        [currentButton addTarget:self action:@selector(imageTouch:withEvent:) forControlEvents:UIControlEventTouchDown];
        [currentButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
        [self.view addSubview:currentButton];
    } else {
        currentButton = sender;
    }
}

- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    currentButton.center = point;
}




@end
