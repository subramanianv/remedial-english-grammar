//
//  TestsViewController.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "TestsViewController.h"
#import "ContentView.h"
@implementation TestsViewController
@synthesize table,array;

//myMethods;

-(void)enterBackGround
{
    NSLog(@"Called");
    
    
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
   
         
  //      array=[[NSArray alloc]initWithObjects:@"Articles",@"Nouns", nil];
             
    
       [self performSelectorOnMainThread:@selector(FillData) withObject:nil waitUntilDone:YES];
    [pool release];
    
}
-(void)FillData
{
    self.title=@"Lessons";
    
self.array=[[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"List" ofType:@"plist"]]objectForKey:@"New item"];

    NSLog(@"Called");
    
      [table setDelegate:self];
    [table setDataSource:self];
    [table reloadData];
    
        
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



-(void)Back
{
    [self dismissModalViewControllerAnimated:YES];
    
    
}
//deglate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [array count];//
    
    NSLog(@"Called 1%d",[array count]);
    
    //[your array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    // Configure the cell...
    //cell.font=[UIFont fontWithName:@"Georgia" size:16.0];

    cell.textLabel.font=[UIFont fontWithName:@"Georgia" size:16.0];
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
  //  cell.textLabel.textColor = UIColorFromRGB(0xFF3366);
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image=[UIImage imageNamed:[[NSBundle mainBundle]pathForResource:@"96-book" ofType:@"png"]];
                          
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
    NSDictionary *dict=[[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"LessonContent" ofType:@"plist"]];
    
    ContentView *vc=[[ContentView alloc]initWithNibName:@"ContentView" bundle:nil withTitle:[array objectAtIndex:indexPath.row] withDictionary:[dict objectForKey:[array objectAtIndex:indexPath.row]] withTotal:[dict count]];
    
                                                                                                                                                        
    [self.navigationController pushViewController:vc animated:YES];
    
    [vc release];
    
    [dict release];
    
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    table=[[UITableView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStylePlain];
    
    
    self.navigationItem.leftBarButtonItem=[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:@selector(Back)]autorelease];
   // self.navigationItem.leftBarButtonItem.title=@"Back";
    
    
    [NSThread detachNewThreadSelector:@selector(enterBackGround) toTarget:self withObject:nil];
    
    
    self.view=table;   
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
