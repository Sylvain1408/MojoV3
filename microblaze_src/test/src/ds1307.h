/*
 * ds1307.h
 *
 *  Created on: Apr 17, 2017
 *      Author: Sylvain
 */

#ifndef DS1307_H_
#define DS1307_H_

//DS1307 macros
#define DS1307_GET_SECONDS(word) (word & 0x0F)
#define DS1307_SET_SECONDS(word, seconds) (word ^= (seconds & 0x0F))
#define DS1307_GET_10_SECONDS(word) (word & 0x70)
#define DS1307_SET_10_SECONDS(word, seconds) (word ^= (seconds & 0x07) << 4)
#define DS1307_GET_MINUTES(word) (word & 0x0F)
#define DS1307_SET_MINUTES(word, minutes) (word ^= (minutes & 0x0F))
#define DS1307_GET_10_MINUTES(word) (word & 0x70)
#define DS1307_SET_10_MINUTES(word, minutes) (word ^= (minutes & 0x07) << 4)
#define DS1307_GET_HOURS(word) (word & 0x0F)
#define DS1307_SET_HOURS(word, hours) (word ^= (hours & 0x0F))
#define DS1307_GET_10_HOURS(word) (word & 0x10)
#define DS1307_SET_10_HOURS(word, hours) (word ^= (hours & 0x01) << 4)
#define DS1307_GET_AM_PM(word) (word & 0x20)
#define DS1307_SET_AM(word, am) (word ^= (am & 0x02) << 5)
#define DS1307_GET_12_24(word) (word & 0x30)
#define DS1307_SET_12_24(word, hours) (hours ^= (hours & 0x03) << 6)
#define DS1307_GET_DAY(word) (word & 0x3)
#define DS1307_SET_DAY(word, day) (word ^= (day & 0x03))
#define DS1307_GET_DATE(word) (word & 0x07)
#define DS1307_SET_DATE(word, date) (word ^= (date & 0x07))
#define DS1307_GET_10_DATE(word) (word & 0x30)
#define DS1307_SET_10_DATE(word, date) (word ^= (date & 0x03) << 4)
#define DS1307_GET_MONTH(word) (word & 0x0F)
#define DS1307_SET_MONTH(word, month) (word ^= (month & 0x0F))
#define DS1307_GET_10_MONTH(word) (word & 0x10)
#define DS1307_SET_10_MONTH(word, month) (word ^= (month & 0x01) << 4)
#define DS1307_GET_YEAR(word) (word & 0x0F)
#define DS1307_SET_YEAR(word, year) (word ^= (year & 0x0F))
#define DS1307_GET_10_YEAR(word) (word & 0xF0)
#define DS1307_SET_10_YEAR(word, year) (word ^= (year & 0x0F) << 4)
#define DS1307_GET_RS0(word) (word & 0x01)
#define DS1307_SET_RS0(word) (word ^= 0x01)
#define DS1307_RESET_RS0(word) (word &= 0xFE)
#define DS1307_GET_RS1(word) (word & 0x02)
#define DS1307_SET_RS1(word) (word ^= 0x02)
#define DS1307_RESET_RS1(word) (word &= 0xFD)
#define DS1307_GET_SQWE(word) (word & 0x10)
#define DS1307_SET_SQWE(word) (word ^= 0x10)
#define DS1307_RESET_SQWE(word) (word &= 0x00)
#define DS1307_GET_OUT(word) (word & 0x80)
#define DS1307_SET_OUT(word) (word ^= 0x80)
#define DS1307_RESET_OUT(word) (word &= 0x7F)

void ds1307SetSeconds(int* word, unsigned int seconds);
int ds1307GetSeconds(int word);

void ds1307SetMinutes(int* word, unsigned int minutes);
int ds1307GetMinutes(int word);

void ds1307SetHours(int* word, unsigned int hours);
int ds1307GetHours(int word);


#endif /* DS1307_H_ */
