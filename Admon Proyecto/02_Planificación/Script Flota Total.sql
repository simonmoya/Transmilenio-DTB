Select DATEDIFF(day, '2017/12/31', '2018/04/18') as fecha_operativa, b.vehiculo, b.operador,  
case b.estado When 2 Then 'D' Else 'V' end as estado_vinculacion,
case c.estado When 0 Then 'A' Else 'I' end as estado_vehiculo,
ISNULL(
(SELECT 'A'  
FROM [SAEExplotacionNext].[dbo].[PosicionesLog] A with(nolock) 
Where 
CONVERT(DATE,a.Instante) = '2018/04/18' 
And Estado='5' 
And  Not a.Linea Is NULL
And a.unidad = b.vehiculo
Group by a.unidad), 'N' 
) as asignacion, CONVERT(DATE,d.vinculacion) as vinculacion,
B.certvinculacion,
DATEDIFF(day, '12/31/2017', CONVERT(DATE,e.fecharevision)) as fechainmovilizacion,
convert(varchar,e.fecharevision,108) as horainmovilizacion,
DATEDIFF(day, '12/31/2017', CONVERT(DATE,e.fechahabilitacion)) as fechahabilitacion,
convert(varchar,e.fechahabilitacion,108) AS hora_habilitacion
From
SAEBaseNext.dbo.Vehiculos b
left join 
(
Select b.operador, a.matricula, b.etiqueta, e.fecharevision, max(a.fechahabilitacion) as fechahabilitacion 
From vehiculos_inmovilizado a, vehiculos b, vehiculos_basico c,
(Select matricula, max(vinculacion) as vinculacion from vehiculos
Where CONVERT(DATE,vinculacion) <= '2018/04/18'
group by matricula) d,
(Select matricula, max(fecharevision) as fecharevision from vehiculos_inmovilizado
Where CONVERT(DATE,fecharevision) <= '2018/04/18'
Group by matricula) e
WHERE
a.matricula = b.matricula
And a.matricula = c.matricula
And a.matricula = d.matricula
And a.matricula = e.matricula
And b.vinculacion = d.vinculacion
And a.fecharevision = e.fecharevision 
And ((CONVERT(DATE,e.fecharevision) <= '2018/04/18' and a.fechahabilitacion is NULL)
Or (CONVERT(DATE,e.fecharevision) <= '2018/04/18' and a.fechahabilitacion >= '2018/04/18'))
And (c.estado = 0 )   
And (b.estado != 2 or b.retiro is null or b.retiro >= '2018/04/18')
Group by b.operador, a.matricula, b.etiqueta, e.fecharevision
) e 
on b.matricula = e.matricula,
Vehiculos_Basico c, 
(Select matricula, max(vinculacion) as vinculacion from SAEBaseNext.dbo.Vehiculos
Where CONVERT(DATE,vinculacion) <= '2018/04/19' 
group by matricula) d,
(
SELECT distinct operador
  FROM 
  [SAEBaseNext].[dbo].[vwPlanificacionHorario] with (nolock), [SAEBaseNext].[dbo].[Vigencias] with (nolock) 
  WHERE 
  [SAEBaseNext].[dbo].[vwPlanificacionHorario].JornadaTipo = [SAEBaseNext].[dbo].[Vigencias].JornadaTipo 
  AND 
  [SAEBaseNext].[dbo].[Vigencias].Fecha='2018/04/18'
) f
WHERE
b.matricula = c.matricula
And b.matricula = d.matricula
And b.vinculacion = d.vinculacion
And b.Operador = f.Operador