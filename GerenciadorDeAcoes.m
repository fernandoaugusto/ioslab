//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by Adriano Negrão on 25/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes

-(id)initWithContato:(Contato *)contato{
    self = [super init];
    if(self){
        self.contato = contato;
    }
    return self;
}

-(void)acoesDoController:(UIViewController *)controller{
    self.controller = controller;
    UIActionSheet* opcoes = [[UIActionSheet alloc]
                             initWithTitle: self.contato.nome
                             delegate:self
                             cancelButtonTitle:@"Cancelar"
                             destructiveButtonTitle:nil
                             otherButtonTitles:@"Ligar", @"Enviar Email", @"Visualizar site", @"Abrir mapa", nil];
    [opcoes showInView:controller.view];
}

    -(void)actionSheet:(UIActionSheet*) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
        switch (buttonIndex) {
            case 0:
                [self ligar];
                break;
            /*case 1:
                [self enviarEmail];
                break;*/
            case 2:
                [self abrirSite];
                break;
            case 3:
                [self mostrarMapa];
                break;
            default:
                break;
        }
        
    }

    -(void) abrirAplicativoComURL:(NSString*) url {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
    }

    -(void) ligar {
        
        UIDevice* device = [UIDevice currentDevice];
        
        if ([device.model isEqualToString:@"iPhone"]) {
            NSString* numero = [NSString stringWithFormat:@"tel:%@", self.contato.telefone];
            [self abrirAplicativoComURL:numero];
        }else{
            [[[UIAlertView alloc] initWithTitle:@"Impossível fazer ligação" message:@"Seu dispostivo nao é um iphone" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        }
        
    }

    -(void) abrirSite {
    
        NSString* url = self.contato.site;
        if (![url hasPrefix:@"http://"]) {
            url = [NSString stringWithFormat:@"http://%@", url];
        }
        [self abrirAplicativoComURL:url];
    
    }

    -(void) mostrarMapa {
        NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", self.contato.endereco]
                          stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [self abrirAplicativoComURL:url];
    }


@end