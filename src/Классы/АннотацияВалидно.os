// Сообщение, выводимое при невалидном значении
//
Перем _Сообщение;

Функция ИмяОграничения() Экспорт
	Возврат "Валидно";
КонецФункции

Функция Сообщение() Экспорт
	Возврат _Сообщение;
КонецФункции

Функция Код() Экспорт
	Возврат "valid";
КонецФункции

&Аннотация("Валидно")
Процедура ПриСозданииОбъекта(Сообщение = "Значение не валидно")
	_Сообщение = Сообщение;
КонецПроцедуры
