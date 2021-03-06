//
//  Contato.h
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Contato : NSObject

    @property (strong) NSString* nome;
    @property (strong) NSString* telefone;
    @property (strong) NSString* endereco;
    @property (strong) NSString* email;
    @property (strong) NSString* site;

    @property (strong) UIImage* foto;

    @property (strong) NSNumber *latitude;
    @property (strong) NSNumber *longitude;

@end
