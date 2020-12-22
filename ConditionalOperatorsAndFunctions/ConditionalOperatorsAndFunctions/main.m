//
//  main.m
//  ConditionalOperatorsAndFunctions
//
//  Created by Лолита on 22.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

// 1. Функция проверки, входит ли символ в алфавит
BOOL isContain (char inputedChar) {
    if (((inputedChar >= 'a')&&(inputedChar <= 'z'))||((inputedChar >= 'A')&&(inputedChar <= 'Z'))) {
        NSLog(@ "Символ принадлежит алфавиту");
        return YES;
    }
    else
       NSLog(@ "Символ не принадлежит алфавиту");
        return NO;
}

//2. Разделить метод  Calculate

int summ (int a, int b) {
    return a + b;
}
int diff (int a, int b) {
    return a - b;
}
int del (int a, int b) {
    return a / b;
}
int mult (int a, int b) {
    return a * b;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Задание 1
        printf("Enter the symbol: ");
        char sym;
        scanf("%s", &sym);
        NSLog(@"%d", isContain(sym));
        
        //Задание 2
        NSLog(@"\n Enter the math operator sign: ");
        char operator;
        scanf("%s", &operator);
        
        NSLog(@"\n Enter the first number: ");
        int firstNum;
        scanf("%d", &firstNum);
        
        NSLog(@"\n Enter the second number: ");
        int secondNum;
        scanf("%d", &secondNum);
        
        switch (operator) {
            case '+':
                NSLog(@"\n Sum result = %i", summ(firstNum, secondNum));
                break;
            case '-':
            NSLog(@"\n Diff result = %i", diff(firstNum, secondNum));
            break;
            
            case '/':
            NSLog(@"\n Sum result = %i", del(firstNum, secondNum));
            break;
            
            case '*':
            NSLog(@"\n Sum result = %i", mult(firstNum, secondNum));
            break;
                
            default:
                NSLog(@"Unknown operator");
                break;
        }

    }
    return 0;
}
