//
//  LineSegment.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-20.
//  Copyright © 2017 steve. All rights reserved.
//

#import "LineSegment.h"

@implementation LineSegment

- (instancetype)initWithFirstPoint:(CGPoint)first secondPoint:(CGPoint)second
{
  if (self = [super init]) {
    _firstPoint = first;
    _secondPoint = second;
  }
  return self;
}
@end
