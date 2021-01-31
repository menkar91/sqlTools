create or alter function fn_months()
returns @output table ([value] int, [month] char(2), [name] varchar(10))
as
/* 
Date: 2021-01-30
Author: @menkar91
Note: Genera un listado de n�meros con la cantidad establecida
Parameter:
- @quantity: Cantidad de registros a generar
*/
begin
    declare @i int=1
	
    while @i <= 12
    begin
        insert into @output ([value],[month],[name])
        values (@i, right(concat('00',@i),2), datename(month,DATEADD(month,(@i-1),'1900-01-01')))

        set @i += 1
    end

    return
end