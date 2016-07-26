//
//  Contato.m
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato : NSObject

NSArray<NSString*>* array;

    - (NSString*) description {
        return [NSString stringWithFormat:@"Nome: %@, Telefone: %@, Email: %@, Endereço: %@, Site: %@", self.nome, self.telefone, self.email, self.endereco, self.site];
    }

    

@end
