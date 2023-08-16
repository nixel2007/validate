Перем Рефлектор;
Перем Валидатор;

// ТаблицаЗначений - Список валидаций:
//  * ИмяОграничения - Строка - Имя аннотации ограничения
//  * ИмяКлассаОграничения - Строка - Имя класса ограничения
//  * ИмяКлассаВалидации - Имя класса валидации
Перем СтандартныеВалидации;

Функция ПолучитьОбъектыВалидации(Аннотация) Экспорт
	
	ДанныеВалидации = СтандартныеВалидации.Найти(Аннотация.Имя, "ИмяОграничения");

	Если ДанныеВалидации = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	ИмяКлассаОграничения = ДанныеВалидации.ИмяКлассаОграничения;
	ИмяКлассаВалидации = ДанныеВалидации.ИмяКлассаВалидации;
	
	Валидация = Новый(ИмяКлассаВалидации);
	Валидация.Инициализировать(Аннотация);
	
	Если Рефлектор.МетодСуществует(Валидация, "УстановитьВалидатор") Тогда
		Валидация.УстановитьВалидатор(Валидатор);
	КонецЕсли;

	Ограничение = Новый(ИмяКлассаОграничения);

	Возврат Новый Структура("Валидация, Ограничение", Валидация, Ограничение);

КонецФункции

Функция СтандартныеВалидации()
	
	СтандартныеВалидации = Новый ТаблицаЗначений();
	СтандартныеВалидации.Колонки.Добавить("ИмяОграничения");
	СтандартныеВалидации.Колонки.Добавить("ИмяКлассаОграничения");
	СтандартныеВалидации.Колонки.Добавить("ИмяКлассаВалидации");
	
	ИменаСтандартныхВалидаций = Новый Массив;
	ИменаСтандартныхВалидаций.Добавить("ВалидацияОграниченияЗаполнено");
	ИменаСтандартныхВалидаций.Добавить("ВалидацияОграниченияВалидно");
	ИменаСтандартныхВалидаций.Добавить("ВалидацияОграниченияИстина");
	ИменаСтандартныхВалидаций.Добавить("ВалидацияОграниченияЛожь");
	
	Для Каждого ИмяКлассаВалидации Из ИменаСтандартныхВалидаций Цикл
		ИмяКлассаОграничения = ИмяКлассаОграничения(ИмяКлассаВалидации);
		ИмяОграничения = ИмяОграничения(ИмяКлассаОграничения);
		
		СтандартнаяВалидация = СтандартныеВалидации.Добавить();
		СтандартнаяВалидация.ИмяОграничения = ИмяОграничения;
		СтандартнаяВалидация.ИмяКлассаОграничения = ИмяКлассаОграничения;
		СтандартнаяВалидация.ИмяКлассаВалидации = ИмяКлассаВалидации;
	КонецЦикла;
	
	Возврат СтандартныеВалидации;
	
КонецФункции

Функция ИмяКлассаОграничения(ИмяКлассаВалидации)
	
	РефлекторОбъекта = Новый РефлекторОбъекта();
	РефлекторОбъекта.УстановитьОбъект(Тип(ИмяКлассаВалидации));
	Методы = РефлекторОбъекта.ПолучитьТаблицуМетодов("Ограничение", Ложь);
	
	Конструктор = Методы[0];
	
	Аннотация = Конструктор.Аннотации.Найти("ограничение", "Имя");
	
	Возврат Аннотация.Параметры[0].Значение;
	
КонецФункции

Функция ИмяОграничения(ИмяКлассаОграничения)
	
	РефлекторОбъекта = Новый РефлекторОбъекта();
	РефлекторОбъекта.УстановитьОбъект(Тип(ИмяКлассаОграничения));
	Методы = РефлекторОбъекта.ПолучитьТаблицуМетодов("ИмяОграничения", Ложь);
	
	Конструктор = Методы[0];
	
	Аннотация = Конструктор.Аннотации.Найти("имяограничения", "Имя");
	
	Возврат Аннотация.Параметры[0].Значение;
	
КонецФункции

Процедура ПриСозданииОбъекта(пВалидатор)
	Рефлектор = Новый Рефлектор;
	СтандартныеВалидации = СтандартныеВалидации();

	Валидатор = пВалидатор;
КонецПроцедуры