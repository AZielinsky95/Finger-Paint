//
//  ViewController.m
//  Finger Paint
//
//  Created by Alejandro Zielinsky on 2018-04-20.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "ViewController.h"
#import "Canvas.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet Canvas *canvas;

@end


@implementation ViewController

-(void)viewDidLoad
{
     [super viewDidLoad];
}

- (IBAction)setEraser:(UIButton *)sender
{
    [self.canvas changeStrokeColor:self.canvas.backgroundColor];
    self.canvas.isErasing = YES;
}


- (IBAction)setStrokeColor:(UIButton *)sender
{
    [self.canvas changeStrokeColor:sender.backgroundColor];
    self.canvas.isErasing = NO;
}

@end
