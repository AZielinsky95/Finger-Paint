//
//  Canvas.m
//  Finger Paint
//
//  Created by Alejandro Zielinsky on 2018-04-20.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "Canvas.h"
#import "LineSegment.h"
#import "Line.h"
@interface Canvas() <UITextFieldDelegate>

@property (nonatomic) UIColor *strokeColor;
@property (nonatomic) NSMutableArray <Line *>* lines;
@property (nonatomic) NSTimeInterval previousTimestamp;
@property CGFloat drawSpeed;
@end

@implementation Canvas

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setMultipleTouchEnabled:NO];
        _lines = [NSMutableArray new];
        _isErasing = NO;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    self.previousTimestamp = event.timestamp;
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first secondPoint:first];
    Line *line = [[Line alloc] initWithColor:self.strokeColor andStrokeSize:1.0f];
    
    [line addSegment:segment];
    [self.lines addObject:line];
    [self setNeedsDisplay];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    NSLog(@"%d: %s",__LINE__, __PRETTY_FUNCTION__);
    return YES;
}

- (IBAction)longPressGesture:(UILongPressGestureRecognizer *)sender
{
    CGPoint touch = [sender locationInView:self];
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(touch.x, touch.y,width,height);
    UITextField *text = [[UITextField alloc] initWithFrame:frame];
    text.delegate = self;
    [self addSubview:text];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint second = [touch locationInView:self];
    CGPoint first = [touch previousLocationInView:self];
    
    CGFloat distanceFromPrevious = [self calculateDistanceBetweenTwoPoints:first andPointTwo:second];
    NSTimeInterval timeSincePrevious = event.timestamp - self.previousTimestamp;
    self.drawSpeed = distanceFromPrevious/timeSincePrevious;
    
    NSLog(@"%f",self.drawSpeed);
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first secondPoint:second];
    
    if(self.isErasing)
    {
        self.lines.lastObject.strokeSize = 35.0f;
    }
    else
    {
      self.lines.lastObject.strokeSize = self.drawSpeed;
    }
    [self.lines.lastObject addSegment:segment];
    [self setNeedsDisplay];
}

-(CGFloat)calculateDistanceBetweenTwoPoints:(CGPoint)point1 andPointTwo:(CGPoint)point2
{
    CGFloat dx = (point2.x-point1.x);
    CGFloat dy = (point2.y-point1.y);
    return sqrt(dx*dx + dy*dy);
}

- (void)drawRect:(CGRect)rect
{
    for (Line *line in self.lines)
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineCapStyle = kCGLineCapRound;
        [line.color setStroke];
        path.lineWidth = line.strokeSize;
        
        for (LineSegment *segment in line.lineSegments)
        {
            if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint))
            {
                [path moveToPoint:segment.firstPoint];
                continue;
            }
            [path addLineToPoint:segment.firstPoint];
            [path addLineToPoint:segment.secondPoint];
        
        }
        
        [path stroke];
    }
    
}

-(void)changeStrokeColor:(UIColor*)color
{
    self.strokeColor = color;
}


@end
