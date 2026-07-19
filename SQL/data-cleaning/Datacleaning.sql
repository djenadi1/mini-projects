
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






