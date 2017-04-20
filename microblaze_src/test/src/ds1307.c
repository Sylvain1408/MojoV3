/*
 * ds1307.c
 *
 *  Created on: Apr 17, 2017
 *      Author: Sylvain
 */
#include "ds1307.h"

void ds1307SetSeconds(int* word, unsigned int seconds){
	if(seconds < 10)
		DS1307_SET_SECONDS(*word, seconds);
	else{
		DS1307_SET_10_SECONDS(*word, seconds/10);
		DS1307_SET_SECONDS(*word, (seconds - (seconds/10)*10) );
	}
}

int ds1307GetSeconds(int word){
	return DS1307_GET_SECONDS(word) + DS1307_GET_10_SECONDS(word);
}

void ds1307SetMinutes(int* word, unsigned int minutes){
	if(minutes < 10)
			DS1307_SET_MINUTES(*word, minutes);
		else{
			DS1307_SET_10_MINUTES(*word, minutes/10);
			DS1307_SET_MINUTES(*word, (minutes - (minutes/10)*10) );
		}
}

int ds1307GetMinutes(int word){
	return DS1307_GET_MINUTES(word) + DS1307_GET_10_MINUTES(word);
}

void ds1307SetHours(int* word, unsigned int hours){
	if(hours < 10)
			DS1307_SET_HOURS(*word, hours);

		else{
			DS1307_SET_10_HOURS(*word, hours/10);
			DS1307_SET_HOURS(*word, (hours - (hours/10)*10) );
		}
}

int ds1307GetHours(int word){
	return DS1307_GET_HOURS(word) + DS1307_GET_10_HOURS(word);
}

