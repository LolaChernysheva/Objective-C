//
//  Student.m
//  Homework4
//
//  Created by Лолита on 17.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//


#import "Student.h"

@implementation Student

//fullName должно возвращать строку состоящую из склеенных name и surname
- (NSString *)fullName
{
    return [NSString stringWithFormat: @"%@ %@", self.name, self.surName];
}

//создать класс Студент, а значения свойств устанавливать, используя собственный конструктор
- (void)setInfoName: (NSString *)name
            surName: (NSString *)surName
                age: (NSInteger)age
{
    _name = name;
    _surName = surName;
    _age = age;
}

//Переопределите метод description чтобы при выводе объекта в NSLog выводилась информация по всем его свойствам.
-(NSString *)description
{
    return [NSString stringWithFormat: @"Имя: %@, фамилия: %@, возраст: %ld ", self.name, self.surName, (long)self.age];
}

//Добавьте метод который будет увеличивать его возраст. (Да свойство age только для чтения).
-(void) intersectAge
{
    _age++;
}


@end
