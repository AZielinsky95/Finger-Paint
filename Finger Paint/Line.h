//
//  Line.h
//  Finger Paint
//
//  Created by Alejandro Zielinsky on 2018-04-20.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineSegment.h"

@interface Line : NSObject

@property (nonatomic) NSMutableArray <LineSegment *>* lineSegments;
@property (nonatomic) UIColor *color;
@property (nonatomic) CGFloat strokeSize;
-(void)addSegment:(LineSegment*)line;

- (instancetype)initWithColor:(UIColor*)color andStrokeSize:(CGFloat)size;
@end
