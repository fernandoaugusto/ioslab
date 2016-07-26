//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"

@implementation ListaContatosViewController

    - (id) init {
        self = [super init];
        
        if (self) {
            self.navigationItem.title = @"Contatos";
            UIBarButtonItem* botaoAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
            self.navigationItem.rightBarButtonItem = botaoAdd;
            self.navigationItem.leftBarButtonItem = self.editButtonItem;
            self.dao = [ContatoDAO contatoDaoInstance];
            self.linhaDestaque = -1;
        }
        return self;
    }

    -(NSInteger) numberOfSectionsInTableView:(UITableView*) table {
        
        return 1;
    }

    -(NSInteger) tableView:(UITableView*) table numberOfRowsInSection:(NSInteger) section {
        ContatoDAO* dao = [ContatoDAO contatoDaoInstance];
        return [dao.contatos count];
        
    }

    -(UITableViewCell*) tableView:(UITableView*) table cellForRowAtIndexPath:(NSIndexPath *) index {
        
        static NSString *cellIdentifier = @"Cell";
        UITableViewCell* cell = [table dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        
        Contato* contato = [self.dao buscaContatoDaPosicao: index.row];
        
        cell.textLabel.text = contato.nome;
        
        return cell;
        
    }

    -(void) tableView:(UITableView*) table commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath*) indexPath {
    
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            [self.dao removeContatoDaPosicao:indexPath.row];
            [table deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
    }

    -(void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath *) index {
        self.contatoSelecionado = [self.dao buscaContatoDaPosicao:index.row];
        [self exibeFormulario];
        self.contatoSelecionado = nil;
        /*NSLog(@"Nome: %@", self.contatoSelecionado.nome);*/
    }


    -(void) exibeFormulario{
        UIStoryboard* board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        FormularioContatoViewController* formulario = [board instantiateViewControllerWithIdentifier:@"Form-Contato"];  /* fazendo downcast*/
        formulario.delegate = self;
        if (self.contatoSelecionado) {
            formulario.contato = self.contatoSelecionado;
        }
        [self.navigationController pushViewController:formulario animated:YES];
    }


    
    -(void) viewWillAppear:(BOOL) animated {
        [self.tableView reloadData];
    }

    -(void) viewDidAppear:(BOOL) animated {
        if (self.linhaDestaque >= 0) {
            NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.linhaDestaque inSection:0];
            [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            self.linhaDestaque = -1;
        }
    }

    -(void) viewDidLoad {
        [super viewDidLoad];
        
        UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisAcoes:)];
        
        [self.tableView addGestureRecognizer:longPress];
        
    }

    -(void) exibeMaisAcoes:(UIGestureRecognizer *) gesture {
        if (gesture.state == UIGestureRecognizerStateBegan){
            CGPoint pontoXY = [gesture locationInView:self.tableView];
            NSIndexPath* index = [self.tableView indexPathForRowAtPoint:pontoXY];
            if (index) {
                self.contatoSelecionado = [self.dao buscaContatoDaPosicao:index.row];
                _gerenciador = [[GerenciadorDeAcoes alloc] initWithContato: self.contatoSelecionado];
                [self.gerenciador acoesDoController:self];
            }
        }
    }


    - (void) contatoAtualizado:(Contato*) contato {
        
        self.linhaDestaque = [self.dao buscaPosicaoDoContato:contato];
    }

    - (void) contatoAdicionado:(Contato*) contato {
        
        self.linhaDestaque = [self.dao buscaPosicaoDoContato:contato];
    }



@end
