//
//  HelloWorldLayer.mm
//  Spacegame
//
//  Created by Andy Girvan on 13/06/2011.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "Game.h"

#define PTM_RATIO 32

enum {
	kTagTileMap = 1,
	kTagBatchNode = 1,
	kTagAnimation1 = 1,
};

@implementation Game

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	Game *layer = [Game node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		self.isTouchEnabled = YES;
		
		b2Vec2 gravity;
		gravity.Set(0.0f, -10.0f);
		bool doSleep = true;
        world = new b2World(gravity, doSleep);
		world->SetContinuousPhysics(true);
		
        lh = [[LevelHelperLoader alloc] initWithContentOfFile:@"[NAME OF LEVEL FILE]"];
        [lh addObjectsToWorld:world cocos2dLayer:self];
        
        [self schedule: @selector(tick:)];
        
	}
	return self;
}

-(void) draw
{
	glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    
	// restore default GL states
	glEnable(GL_TEXTURE_2D);
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    
}

-(void) tick: (ccTime) dt
{
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
    
	world->Step(dt, velocityIterations, positionIterations);
    
	
	for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
		if (b->GetUserData() != NULL) {
			CCSprite *myActor = (CCSprite*)b->GetUserData();
			myActor.position = CGPointMake( b->GetPosition().x * PTM_RATIO, b->GetPosition().y * PTM_RATIO);
			myActor.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
		}	
	}
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void) dealloc
{
	delete world;
	world = NULL;
    
	[super dealloc];
}
@end
