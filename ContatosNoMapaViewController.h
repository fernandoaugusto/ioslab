//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios6233 on 26/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@interface ContatosNoMapaViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView* mapa;

@property CLLocationManager* manager;

@end
