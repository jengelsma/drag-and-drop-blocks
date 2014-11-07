//
//  ViewController.m
//  DragAndDropBlocks
//
//  Created by Jonathan Engelsma on 11/7/14.
//  Copyright (c) 2014 Jonathan Engelsma. All rights reserved.
//

#import "BlocksEditorViewController.h"

@interface BlocksEditorViewController ()

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

- (IBAction) imageTouch:(id) sender withEvent:(UIEvent *) event
{
    UIView* theTarget = (UIView*)sender;
    // source buttons (e.g. ones that stay on the button are tagged 99).
    if(theTarget.tag == 99) {
        UIButton *newButton = [[UIButton alloc] initWithFrame:theTarget.frame];
        newButton.tag = 99;
        newButton.backgroundColor = theTarget.backgroundColor;
        [newButton addTarget:self action:@selector(imageTouch:withEvent:) forControlEvents:UIControlEventTouchDown];
        [newButton addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
        [self.view addSubview:newButton];
        theTarget.tag = 0;
    }
}

- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    control.center = point;
}




@end
