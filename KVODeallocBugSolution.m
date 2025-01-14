To fix this, always remove the observer in the `dealloc` method of the observer class.  Here's the corrected code:

```objectivec
@interface MyObserver : NSObject
@property (nonatomic, weak) MyObservedObject *observedObject;

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;

@end

@implementation MyObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // Handle KVO changes
}

- (void)dealloc {
    if(self.observedObject) {
        [self.observedObject removeObserver:self forKeyPath:@