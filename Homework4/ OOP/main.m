//
//  main.m
//  Homework4
//
//  Created by Лолита on 17.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        Student *firstStudent = [[Student alloc] init];
        [firstStudent setInfoName:@"Василий" surName:@"Васильев" age: 35];
        
        Student *secondStudent = [[Student alloc] init];
        [secondStudent setInfoName:@"Светлана" surName:@"Иванова" age: 24];
        
        Student *thirdStudent = [[Student alloc] init];
        [thirdStudent setInfoName:@"Иван" surName:@"Петров" age: 26];
        
        //создать программу, которая будет выводить список всех студентов
        NSLog(@"\n%@ \n%@ \n%@ \n", firstStudent, secondStudent, thirdStudent);
        
        //fullName должно возвращать строку состоящую из склеенных name и surname
        NSLog(@"%@", secondStudent.fullName);
        
        //Добавьте метод который будет увеличивать его возраст. (Да свойство age только для чтения)
        NSLog(@"%@", thirdStudent);
        [thirdStudent intersectAge];
        NSLog(@"%@", thirdStudent);

    }
    
    
    
    
    
    
    return 0;
}
