// Сообщение, выводимое при невалидном значении
//
Перем _Сообщение;

Функция ИмяОграничения() Экспорт	
	Возврат "Заполнено";
КонецФункции

Функция Сообщение() Экспорт
	Возврат _Сообщение;
КонецФункции

Функция Код() Экспорт
	Возврат "filled";
КонецФункции

&Аннотация("Заполнено")
Процедура ПриСозданииОбъекта(Сообщение = "Значение не заполнено") Экспорт
	_Сообщение = Сообщение;
КонецПроцедуры
