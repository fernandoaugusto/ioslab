//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6233 on 18/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

    -(id) initWithCoder: (NSCoder*) coder {    /* ou  (id) é igual a (NSObject*)    os initWithCoder é sempre chamado pelo Storyboard */
    
        self = [super initWithCoder: coder];
        if (self) {
            self.dao = [ContatoDAO contatoDaoInstance]; /*ou    _dao = [ContatoDAO new];  */
            self.navigationItem.title = @"Cadastro";
            UIBarButtonItem* botao = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(adicionaContato)];
            self.navigationItem.rightBarButtonItem = botao;
        }
        
        return self;
        
    }

    -(void) adicionaContato {
        [self pegaDadosDoFormulario];
        [self.dao adiciona:self.contato];
        if (self.delegate) {
            [self.delegate contatoAdicionado:self.contato];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }


    - (IBAction) pegaDadosDoFormulario {
    
        if (!self.contato) {
            self.contato = [Contato new];
        }
        if ([self.botaoFoto backgroundImageForState:UIControlStateNormal]) {
            self.contato.foto = [self.botaoFoto backgroundImageForState:UIControlStateNormal];
        }
        
        self.contato.nome = self.nome.text;
        self.contato.telefone = self.telefone.text;
        self.contato.endereco = self.endereco.text;
        self.contato.email = self.email.text;
        self.contato.site = self.site.text;
    }



    -(void) viewDidLoad {
        if (self.contato) {
            self.navigationItem.title = @"Alterar";
            UIBarButtonItem* confirmar = [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizaContato)];
            self.navigationItem.rightBarButtonItem = confirmar;

            
            self.nome.text = self.contato.nome;
            self.telefone.text = self.contato.telefone;
            self.email.text = self.contato.email;
            self.endereco.text = self.contato.endereco;
            self.site.text = self.contato.site;
            
            if (self.contato.foto) {
                [self.botaoFoto setBackgroundImage:self.contato.foto forState:UIControlStateNormal];
                [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
            }
        
        }
    }

    -(void) atualizaContato{
        [self pegaDadosDoFormulario];
        
        if (self.delegate) {
            [self.delegate contatoAtualizado:self.contato];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }


    -(IBAction) selecionaFoto: (id) sender {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            
            
        } else {
        
            UIImagePickerController* picker = [UIImagePickerController new];
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.allowsEditing = YES;
            picker.delegate = self;
            [self presentViewController:picker animated:YES completion:nil];
            
        }
        
    }


    -(void) imagePickerController:(UIImagePickerController*) picker didFinishPickingMediaWithInfo:(NSDictionary*) info {
    
        UIImage* imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
        [self.botaoFoto setBackgroundImage:imagemSelecionada forState:UIControlStateNormal];
        [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
        [picker dismissViewControllerAnimated:YES completion:nil];
    
    }



@end
