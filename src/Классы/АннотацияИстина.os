// Сообщение, выводимое при невалидном значении
//
Перем _Сообщение;

Функция ИмяОграничения() Экспорт
	Возврат "Истина";
КонецФункции

Функция Сообщение() Экспорт
	Возврат _Сообщение;
КонецФункции

Функция Код() Экспорт
	Возврат "true";
КонецФункции

&Аннотация("Истина")
Процедура ПриСозданииОбъекта(Сообщение = "Значение не равно ""Истина""")
	_Сообщение = Сообщение;
КонецПроцедуры
