//
//  Line.m
//  Finger Paint
//
//  Created by Alejandro Zielinsky on 2018-04-20.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "Line.h"

@interface Line()


@end

@implementation Line

- (instancetype)initWithColor:(UIColor*)color andStrokeSize:(CGFloat)size
{
    self = [super init];
    if (self)
    {
        _lineSegments = [[NSMutableArray alloc] init];
        _color = color;
        _strokeSize = size;
    }
    return self;
}

-(void)addSegment:(LineSegment*)line
{
    [self.lineSegments addObject:line];
}
@end
