//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO


    static ContatoDAO *defaultDao = nil;

    -(id) init {
        self = [super init];
    
        if (self){   /*ou usar if(self != nil) {  pois nil(nulo) é considerado igual a FALSE*/
            _contatos = [NSMutableArray new];
        }
    
        return self;
    }


    +(id) contatoDaoInstance {
        if (!defaultDao) {
            defaultDao = [ContatoDAO new];
        }
        return defaultDao;
        
    }


    -(void) adiciona:(Contato*) contato {
        [self.contatos addObject:contato];
        NSLog(@"Contatos: %@", self.contatos);
        
    }

    -(Contato*) buscaContatoDaPosicao:(NSInteger) posicao {
        
        return self.contatos[posicao];
    
    }


    -(NSInteger) buscaPosicaoDoContato:(Contato*) contato {
    
        return [self.contatos indexOfObject: contato];
    
    }


    -(void) removeContatoDaPosicao:(NSInteger) posicao {
        [self.contatos removeObjectAtIndex:posicao];
    }


@end
