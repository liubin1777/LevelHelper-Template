//
//  HelloWorldLayer.h
//  Spacegame
//
//  Created by Andy Girvan on 13/06/2011.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "LevelHelperLoader.h"

// HelloWorldLayer
@interface Game : CCLayer
{
	b2World* world;
    LevelHelperLoader *lh; 
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
