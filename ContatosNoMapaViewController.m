//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios6233 on 26/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContatosNoMapaViewController.h"

@interface ContatosNoMapaViewController ()

@end

@implementation ContatosNoMapaViewController

    -(id) init {
        self = [super init];
        if(self) {
            UIImage* imagemTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
            
            self.navigationItem.title = @"Localização";
            
            UITabBarItem* tabItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:imagemTabItem tag:0];
            self.tabBarItem = tabItem;
            
            
            
        }
        return self;
    }

    -(void) viewDidLoad {
        [super viewDidLoad];
        
        MKUserTrackingBarButtonItem* botaoGPS = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapa];
        self.navigationItem.rightBarButtonItem = botaoGPS;
        
        self.manager = [CLLocationManager new];
        
        [self.manager requestWhenInUseAuthorization];
        
        
        
    }


@end
