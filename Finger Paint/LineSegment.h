//
//  LineSegment.h
//  W2D5-Demos
//
//  Created by steve on 2017-01-20.
//  Copyright © 2017 steve. All rights reserved.
//

@import UIKit;

@interface LineSegment : NSObject
@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;
- (instancetype)initWithFirstPoint:(CGPoint)first secondPoint:(CGPoint)second;
@end
