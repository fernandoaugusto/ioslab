//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by Adriano Negrão on 25/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MessageUI/MFMailComposeViewController.h"
#import "Contato.h"

@interface GerenciadorDeAcoes : NSObject<UIActionSheetDelegate>

@property Contato* contato;
@property UIViewController* controller;


-(id)initWithContato:(Contato*) contato;

-(void)acoesDoController:(UIViewController*) controller;




@end