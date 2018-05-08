/*
 * ds1307.h
 *
 *  Created on: Apr 17, 2017
 *      Author: Sylvain
 */

#ifndef DS1307_H_
#define DS1307_H_

#include "xiomodule.h"
#include "i2c.h"

//DS1307 macros
#define DS1307_GET_SECONDS(word) ( (word) & 0x0F)
#define DS1307_SET_SECONDS(word, seconds) ( (word) ^= (seconds & 0x0F) )
#define DS1307_GET_10_SECONDS(word) ( ( (word) & 0x70) >> 4)
#define DS1307_SET_10_SECONDS(word, seconds) ( (word) ^= (seconds & 0x07) << 4)
#define DS1307_GET_MINUTES(word) ( (word) & 0x0F)
#define DS1307_SET_MINUTES(word, minutes) ( (word) ^= (minutes & 0x0F))
#define DS1307_GET_10_MINUTES(word) ( ( (word) & 0x70) >> 4)
#define DS1307_SET_10_MINUTES(word, minutes) ( (word) ^= (minutes & 0x07) << 4)
#define DS1307_GET_HOURS(word) ( (word) & 0x0F)
#define DS1307_SET_HOURS(word, hours) ( (word) ^= (hours & 0x0F))
#define DS1307_GET_10_HOURS(word) ( ( (word) & 0x30) >> 4)
#define DS1307_SET_10_HOURS(word, hours) ( (word) ^= (hours & 0x03) << 4)
#define DS1307_GET_AM_PM(word) ( ( (word) & 0x20) >> 5)
#define DS1307_SET_AM_PM(word, am) ( (word) ^= (am & 0x02) << 5)
#define DS1307_GET_12_24(word) ( ( (word) & 0x30) >> 6)
#define DS1307_SET_24_MODE(word) ( (word) |= 0x40)
#define DS1307_SET_12_MODE(word) ( (word) &= 0x40)
#define DS1307_SET_12_24(word, hours) ( (word) ^= (hours & 0x03) << 6)
#define DS1307_GET_DAY(word) ( (word) & 0x7)
#define DS1307_SET_DAY(word, day) ( (word) ^= (day & 0x07))
#define DS1307_GET_DATE(word) ( (word) & 0x0F)
#define DS1307_SET_DATE(word, date) ( (word) ^= (date & 0x0F))
#define DS1307_GET_10_DATE(word) ( ( (word) & 0x30) >> 4)
#define DS1307_SET_10_DATE(word, date) ( (word) ^= (date & 0x03) << 4)
#define DS1307_GET_MONTH(word) ( (word) & 0x0F)
#define DS1307_SET_MONTH(word, month) ( (word) ^= (month & 0x0F))
#define DS1307_GET_10_MONTH(word) ( ( (word) & 0x10) >> 4)
#define DS1307_SET_10_MONTH(word, month) ( (word) ^= (month & 0x01) << 4)
#define DS1307_GET_YEAR(word) ( (word) & 0x0F)
#define DS1307_SET_YEAR(word, year) ( (word) ^= (year & 0x0F))
#define DS1307_GET_10_YEAR(word) ( ( (word) & 0xF0) >> 4)
#define DS1307_SET_10_YEAR(word, year) ( (word) ^= (year & 0x0F) << 4)
#define DS1307_GET_RS0(word) ( (word) & 0x01)
#define DS1307_SET_RS0(word) ( (word) ^= 0x01)
#define DS1307_RESET_RS0(word) (word &= 0xFE)
#define DS1307_GET_RS1(word) ( (word) & 0x02)
#define DS1307_SET_RS1(word) ( (word) ^= 0x02)
#define DS1307_RESET_RS1(word) ( (word) &= 0xFD)
#define DS1307_GET_SQWE(word) ( ( (word) & 0x10) >> 4)
#define DS1307_SET_SQWE(word) ( (word) ^= 0x10)
#define DS1307_RESET_SQWE(word) ( (word) &= 0x00)
#define DS1307_GET_OUT(word) ( ( (word) & 0x80) >> 4)
#define DS1307_SET_OUT(word) ( (word) ^= 0x80)
#define DS1307_RESET_OUT(word) ( (word) &= 0x7F)

//Seconds
void ds1307SetSeconds(u8* word, unsigned int seconds);
unsigned int ds1307GetSeconds(u8 word);
//Minutes
void ds1307SetMinutes(u8* word, unsigned int minutes);
unsigned int ds1307GetMinutes(u8 word);
//Hours
void ds1307SetHours(u8* word, unsigned int hours);
unsigned int ds1307GetHours(u8 word);
void ds1307Set24Mode(u8* word);
void ds1307Set12Mode(u8* word);
//Days (week 0-7)
void ds1307SetDay(u8* word, unsigned int days);
unsigned int ds1307GetDay(u8 word);
//Date (0-31)
void ds1307SetDate(u8* word, unsigned int date);
unsigned int ds1307GetDate(u8 word);
//Month
void ds1307SetMonth(u8* word, unsigned int month);
unsigned int ds1307GetMonth(u8 word);
//Year
void ds1307SetYear(u8* word, unsigned int year);
unsigned int ds1307GetYear(u8 word);

//Using i2c.h write
//Supposing that i2c is well setup via I2C_setup()
void ds1307SetTime(XIOModule* module, unsigned int I2C_BASEADDR, unsigned int seconds, unsigned int minutes, unsigned int hours, unsigned int AmPm,
		unsigned int day, unsigned int date, unsigned int month, unsigned int year);

#endif /* DS1307_H_ */
