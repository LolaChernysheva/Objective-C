//
//  Student.h
//  Homework4
//
//  Created by Лолита on 17.12.2020.
//  Copyright © 2020 Lolita Chernysheva. All rights reserved.
//

//1. Создать программу, которая будет выводить список студентов. Для этого необходимо создать класс Студент, а значения свойств устанавливать, используя собственный конструктор.
//2. У студента должно быть свойство age (возраст), оно должно быть только для чтения
//3. У студента должны быть свойства name, surname и fullName. Первые два должны быть обычными свойствами, а fullName должно возвращать строку состоящую из склеенных name и surname.
//4. Переопределите метод description чтобы при выводе объекта в NSLog выводилась информация по всем его свойствам.
//5. Добавьте метод который будет увеличивать его возраст. (Да свойство age только для чтения).


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, assign, readonly) NSInteger *age;

- (NSString *) fullName;
- (void)setInfoName: (NSString *)name
            surName: (NSString *)surName
                age: (NSInteger)age;
- (void) intersectAge;

@end

NS_ASSUME_NONNULL_END
