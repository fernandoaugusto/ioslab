//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject

    @property (strong) NSMutableArray<Contato*>* contatos;

    - (void) adiciona: (Contato*) contato;

    +(id) contatoDaoInstance;

    -(NSInteger) buscaPosicaoDoContato:(Contato*) contato;

    -(Contato*) buscaContatoDaPosicao:(NSInteger) posicao;

    -(void) removeContatoDaPosicao:(NSInteger) posicao;

@end
