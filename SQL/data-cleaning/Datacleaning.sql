SET SQL_SAFE_UPDATES = 0;
#world_layoffs was imported as csv to table layoffs uder the database world_layoffs

select * from layoffs;



#-- data cleaning
#--general work flow

#--1. remove-duplicates 
#note: only if we know this specific data shouldnt have duplicates 
#--2. standarize our data if there was mistakes 
#--3. look at null and blank values
#--4.remove any collums 


#fist we have to stage our data by creating a new table from the raw table incase we made mistakes 


create table layoffs_staging
	like layoffs;
    
insert into layoffs_staging
select * from layoffs;


#Removing Duplicates 

CREATE TABLE `layoffs_staging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `rn` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into layoffs_staging_2
	select *, (row_number() over(partition by company,location,`date`,stage, percentage_laid_off, funds_raised_millions)) as rn
    from layoffs_staging ;

delete from layoffs_staging_2 where rn > 1 ;

#--Standarizing the data

update layoffs_staging_2 
set company = trim(company);



