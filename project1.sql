--source file : https://www.kaggle.com/datasets/hendratno/covid19-indonesia?resource=download

select *
from Project_DataAnalyst..covid_19_indonesia
order by 3,1


-- 
select Date, Location, [New Cases], [New Deaths], [New Recovered], [Total Cases], [Total Deaths], [Total Recovered], Population 
from Project_DataAnalyst..covid_19_indonesia
order by 2,1

-- cari perbandingan kematian dan sembuh terhadap kasus
select [Location], Date, [Total Recovered],[Total Deaths], [Total Cases]
, [Total Recovered]/[Total Cases]*100 as persentase_sembuh, [Total Deaths]/[Total Cases]*100 as persentase_meninggal
, Population
from Project_DataAnalyst..covid_19_indonesia
where Location <> 'indonesia'
order by 1,2

--cari perbandingan kasus terhadap populasi
select [Location], Date, [Total Recovered],[Total Deaths], [Total Cases], Population
, [Total Cases]/Population *100 as populasi_kasus, [Total Deaths]/Population*100 as populasi_meninggal, [Total Recovered]/Population * 100 as populasi_sembuh 
from Project_DataAnalyst..covid_19_indonesia
where Location <> 'Indonesia'
order by 1,2

-- mencari kematian dan kesembuhan tertinggi tiap lokasi
select Location, sum([Total Deaths]) meninggal_total, sum([Total Active Cases]) toal_kasus_aktif
, sum([Total Recovered]) as [total sembuh], sum([Total Cases]) as [total kasus]
from Project_DataAnalyst..covid_19_indonesia
where Location <> 'Indonesia'
group by Location
order by Location


-- mencari kematian dan kesembuhan tertinggi berdasarkan tanggal
select date, sum([New Deaths]) meninggal_tertinggi, sum([New Recovered]) as [sembuh tertinggi]
, sum([New Active Cases]) as kasus_aktif_tertinggi, sum([New Cases]) as kasus_tertinggi
from Project_DataAnalyst..covid_19_indonesia
where Location <> 'Indonesia'
group by date
order by 1


-- mencari total covid tanggal
select date, sum(cast([New Cases]as int)) as total_kasus, sum(cast([New Deaths]as int)) as total_kematian, sum(cast([New Recovered]as int)) as total_sembuh
from Project_DataAnalyst..covid_19_indonesia
where Location <> 'Indonesia'
group by Date
order by 1

--mencari jumlah total covid
select sum([New Cases]) as total_kasus, sum([New Deaths]) as total_kematian, sum([New Deaths]) as total_sembuh
from Project_DataAnalyst..covid_19_indonesia
where Location <> 'Indonesia'

--membuat kasus berdasarkan provinsi
select Province, sum([New Cases]) as total_kasus, sum([New Deaths]) as total_kematian, sum([New Deaths]) as total_sembuh
from Project_DataAnalyst..covid_19_indonesia
where Location <> 'Indonesia'
group by Province
order by 1

-- Beberapa hasil dari data ini akan diolah ke tableau
-- hasil dari tableau dapat dilihat di link berikut : https://public.tableau.com/app/profile/fernando.septian.siahaan/viz/CovidIndonesia_16488264034270/Dashboard1
