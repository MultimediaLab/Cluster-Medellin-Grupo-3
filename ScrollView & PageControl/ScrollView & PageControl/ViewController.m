#import "ViewController.h"

@interface ViewController ()

@property NSArray * pageImages;
@property NSMutableArray * pageViews;

@end

@implementation ViewController

-(void)loadPage:(NSInteger)page{
    if (page < 0 || page >=self.pageImages.count) {
        return;
    }
    //Cargar Pagina
    UIView * pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        CGRect frame = self.scrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        
        UIImageView * newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        NSLog(@"%f", newPageView.frame.origin.x);
        [self.scrollView addSubview:newPageView];
        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
    }
}
-(void)purgePage:(NSInteger)page{
    if (page < 0 || page >=_pageImages.count) {
        return;
    }
    UIView * pageView = [_pageViews objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [_pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}
-(void)loadVisiblePages{
    CGFloat pageWidth = _scrollView.frame.size.width;
    NSInteger page = floor((_scrollView.contentOffset.x*2.0f + pageWidth)/ (pageWidth * 2.0f));
    
    _pageControl.currentPage = page;
    
    //Paginas que se van a cargar
    NSInteger firstPage = page-1;
    NSInteger lastPage = page +1;
    
    //Borrar lo que este antes de la primera pagina
    for (NSInteger i = 0; i<firstPage; i++) {
        [self purgePage:i];
    }
    //Cargar la pagina que este en el rango
    for (NSInteger i = firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    //Borar las paginas q esten despues de la ultima pagina
    for (NSInteger i = lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"photo1.png"], [UIImage imageNamed:@"photo2.png"], [UIImage imageNamed:@"photo3.png"],[UIImage imageNamed:@"photo4.png"],[UIImage imageNamed:@"photo5.png"],nil];
    NSInteger pageCount = _pageImages.count;
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = pageCount;
    
    _pageViews = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i<pageCount; i++) {
        [_pageViews addObject:[NSNull null]];
    }
    
    _scrollView.delegate = self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CGSize pageScrollViewSize = _scrollView.frame.size;
    _scrollView.contentSize = CGSizeMake(pageScrollViewSize.width * _pageImages.count, pageScrollViewSize.height);
    [self loadVisiblePages];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
        [self loadVisiblePages];

}

@end
