#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (numbersArray == nil || numbersArray.count == 0) {
        return @"";
    }
    NSString *numberNotInRange = @"The numbers in the input array can be in the range from 0 to 255.";
    NSString *numberIsNegative = @"Negative numbers are not valid for input.";
    NSMutableString *result = [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < 4; i++) {
        NSInteger nextOctet = 0;
        if (i < numbersArray.count) {
            nextOctet = [numbersArray[i] intValue];
        }
        if (nextOctet > 255) {
            return numberNotInRange;
        } else if (nextOctet < 0) {
            return numberIsNegative;
        } else {
            [result appendFormat:@"%ld.", nextOctet];
        }
    }
    
    return [result substringToIndex:[result length] - 1];
}

@end
