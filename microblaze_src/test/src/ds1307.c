/*
 * ds1307.c
 *
 *  Created on: Apr 17, 2017
 *      Author: Sylvain
 */
#include "ds1307.h"

void ds1307SetSeconds(unsigned int* word, unsigned int seconds){
	if(seconds < 10)
		DS1307_SET_SECONDS(*word, seconds);
	else{
		DS1307_SET_10_SECONDS(*word, seconds/10);
		DS1307_SET_SECONDS(*word, (seconds - (seconds/10)*10) );
	}
}

unsigned int ds1307GetSeconds(unsigned int word){
	return DS1307_GET_SECONDS(word) + DS1307_GET_10_SECONDS(word);
}

void ds1307SetMinutes(unsigned int* word, unsigned int minutes){
	if(minutes < 10)
			DS1307_SET_MINUTES(*word, minutes);
		else{
			DS1307_SET_10_MINUTES(*word, minutes/10);
			DS1307_SET_MINUTES(*word, (minutes - (minutes/10)*10) );
		}
}

unsigned int ds1307GetMinutes(unsigned int word){
	return DS1307_GET_MINUTES(word) + DS1307_GET_10_MINUTES(word);
}

void ds1307SetHours(unsigned int* word, unsigned int hours){
	if(hours < 10)
			DS1307_SET_HOURS(*word, hours);

		else{
			DS1307_SET_10_HOURS(*word, hours/10);
			DS1307_SET_HOURS(*word, (hours - (hours/10)*10) );
		}
}

unsigned int ds1307GetHours(unsigned int word){
	return DS1307_GET_HOURS(word) + DS1307_GET_10_HOURS(word);
}

void ds1307SetAMPM(unsigned int* word, unsigned int am){
	DS1307_SET_AM_PM(*word, am);
}

unsigned int ds1307GetAMPM(unsigned int word){
	return DS1307_GET_AM_PM(word);
}

void ds1307SetDay(unsigned int* word, unsigned int day){
	DS1307_SET_DAY(*word, day);
}

unsigned int ds1307GetDay(unsigned int word){
	return DS1307_GET_DAY(word);
}

void ds1307SetDate(unsigned int* word, unsigned int date){
	if(date < 10)
		DS1307_SET_HOURS(*word, date);

	else{
		DS1307_SET_10_HOURS(*word, date/10);
		DS1307_SET_HOURS(*word, (date - (date/10)*10) );
	}
}

unsigned int ds1307GetDate(unsigned int word){
	return DS1307_GET_DATE(word) + DS1307_GET_10_DATE(word);
}

void ds1307SetMonth(unsigned int* word, unsigned int month){
	if(month < 10)
		DS1307_SET_MONTH(*word, month);

	else{
		DS1307_SET_10_MONTH(*word, month/10);
		DS1307_SET_MONTH(*word, (month - (month/10)*10) );
	}
}

unsigned int ds1307GetMonth(unsigned int word){
	return DS1307_GET_MONTH(word) + DS1307_GET_10_MONTH(word);
}

void ds1307SetYear(unsigned int* word, unsigned int year){
	if(year < 10)
		DS1307_SET_YEAR(*word, year);
	else{
		DS1307_SET_10_YEAR(*word, year/10);
		DS1307_SET_YEAR(*word, (year - (year/10)*10) );
	}
}

unsigned int ds1307GetYear(unsigned int word){
	return DS1307_GET_YEAR(word) + DS1307_GET_10_YEAR(word);
}

