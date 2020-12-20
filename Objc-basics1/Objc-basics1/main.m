//
//  main.m
//  Objc-basics1
//
//  Created by Лолита on 20.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
// 1. Создать программу, которая будет применять к введенным числам различные арифметические операции (на основе практической задачи 3).
// 2. Улучшить программу: организовать вывод результата и переменных в консоль одной строкой (как в практической задаче 2).
// 3*.Создать приложение, которое будет вычислять среднее число из трех переменных, не применяя специальные функции.

        int firstNum = 0;
        int secondNum = 0;
        int thirdNum = 0;
        
        printf("Первое число: ");
        scanf("%d", &firstNum);
        printf("Второе число: ");
        scanf("%d", &secondNum);
        printf("Третье число: ");
        scanf("%d", &thirdNum);

        int summ = firstNum + secondNum;
        int sub = firstNum - secondNum;
        int mult = firstNum * secondNum;
        int average = (firstNum + secondNum + thirdNum) / 3;
        if (secondNum != 0)            
        {
            float div = (float)firstNum / (float)secondNum;
            NSLog(@"\n Сумма введенных чисел: %d, \n Разница введенных чисел: %d, \n Произведение введенных чисел: %d, \n Частное введенных чисел: %f, \n Среднее арифметическое введенных чисел: %d", summ, sub, mult, div, average);
        }
        else
        {
            NSLog(@"\n Сумма введенных чисел: %d, \n Разница введенных чисел: %d, \n Произведение введенных чисел: %d, \n Частное введенных чисел не может быть определено, так как делитель равен 0 \n Среднее арифметическое введенных чисел: %d", summ, sub, mult, average);
        }
        
    }
    return 0;
}
