﻿Процедура ОбновитьОстаткиНаSelSup() Экспорт
	
	ЗаписьЖурналаРегистрации("ИнтеграцияСSelSup.ОбновлениеОстатковНаСайте", УровеньЖурналаРегистрации.Информация, , , "Запущено регламентное обновление остатков.");	  
		
	Запрос = Новый Запрос(
	"ВЫБРАТЬ РАЗРЕШЕННЫЕ
	|	SS_КлючиAPI.КлючAPI КАК КлючAPI
	|ИЗ
	|	РегистрСведений.SS_КлючиAPI КАК SS_КлючиAPI
	|ГДЕ
	|	SS_КлючиAPI.Использовать");
	
	ТаблицаКлючейAPI = Запрос.Выполнить().Выгрузить();
	Если ТаблицаКлючейAPI.Количество() > 0 Тогда  
		SS_Обработка = Обработки.SS_ОбменSelSup_УТ.Создать();
		SS_Обработка.ApiKey = ТаблицаКлючейAPI[0].КлючAPI;  
		SS_Обработка.ОбновитьОстаткиНаСайте();
	Иначе
		ЗаписьЖурналаРегистрации("ИнтеграцияСSelSup.ОбновлениеОстатковНаСайте", УровеньЖурналаРегистрации.Ошибка, , , "Ошибка при получении ключа API");	
	КонецЕсли;
	
	ЗаписьЖурналаРегистрации("ИнтеграцияСSelSup.ОбновлениеОстатковНаСайте", УровеньЖурналаРегистрации.Информация, , , "Завершено регламентное обновление остатков.");
	
КонецПроцедуры
