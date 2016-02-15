//
//  ListaValoresTableViewController.m
//  Ibex 35
//
//  Created by Dani on 08/02/16.
//  Copyright © 2016 Dani. All rights reserved.
//

#import "ListaValoresTableViewController.h"
#import "Valor.h"
#import "DetailValorViewController.h"

@interface ListaValoresTableViewController ()

@end

@implementation ListaValoresTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self fetchValores];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arrayValores count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *simpleIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleIdentifier];
    }
    
    // Configure the cell...
    Valor *currentValor = [self.arrayValores objectAtIndex:indexPath.row];
    cell.textLabel.text = currentValor.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ / %@", currentValor.last, currentValor.var];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
//    DetailValorViewController *destVC = [[DetailValorViewController alloc] init];
    
//    Valor *currentValor = [self.arrayValores objectAtIndex:indexPath.row];
//    destVC.valor = currentValor;
}

- (void)fetchValores{
    NSString *urlString = @"http://query.yahooapis.com/v1/public/yql?format=json&callback=&_maxage=60&q=use%20%22https%3A%2F%2Fraw.githubusercontent.com%2Fdavidayalas%2Fyql-stocks%2Fmaster%2Fstocks.xml%22%20as%20bolsa%3B%20select%20*%20from%20bolsa%20where%20url%3D%22http%3A%2F%2Fwww.eleconomista.es/indice/IBEX-35%22";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *parseError;
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];

        // Do something with json
        dispatch_async(dispatch_get_main_queue(), ^{
            // Call some function
            NSDictionary *items = json[@"query"][@"results"][@"items"][@"item"];

            for (NSDictionary *item in items){
                NSString *vName = [item objectForKey:@"name"];
                NSString *vLast = [item objectForKey:@"last"];
                NSString *vTime = [item objectForKey:@"time"];
                NSString *vVar = [item objectForKey:@"var"];
                NSString *vVarEur = [item objectForKey:@"var_euro"];
                NSString *vVolume = [item objectForKey:@"volume"];
                
                Valor *newValor = [[Valor alloc] initWithName:vName andLastValue:vLast andTime:vTime andVariation:vVar andVariationEur:vVarEur andVolume:vVolume];
                [_arrayValores addObject:newValor];
            }
            [self.tableView reloadData];
        });
    }] resume];

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailValorViewController"]) {
        DetailValorViewController *destVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Valor *currentValor = self.arrayValores[indexPath.row];
        
        destVC.valor = currentValor;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSMutableArray *)arrayValores {
    if (!_arrayValores) {
        _arrayValores = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _arrayValores;
}

@end
