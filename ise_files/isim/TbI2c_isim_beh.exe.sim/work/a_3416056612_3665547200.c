/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/workspace/Mojo-Base-VHDL/ise_files/i2c_master.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_3416056612_3665547200_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    int t20;
    int t21;
    int t22;
    int t23;
    int t24;
    int t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 7504);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 7648);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 5208U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    goto LAB3;

LAB5:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2952U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t2 = (t0 + 7712);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t11;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 5208U);
    t2 = *((char **)t1);
    t14 = *((int *)t2);
    t1 = (t0 + 5088U);
    t5 = *((char **)t1);
    t15 = *((int *)t5);
    t16 = (t15 * 4);
    t17 = (t16 - 1);
    t3 = (t14 == t17);
    if (t3 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 4552U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB13;

LAB14:
LAB11:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 5208U);
    t2 = *((char **)t1);
    t14 = *((int *)t2);
    t1 = (t0 + 5088U);
    t5 = *((char **)t1);
    t15 = *((int *)t5);
    t16 = (t15 - 1);
    if (t14 >= 0)
        goto LAB21;

LAB20:    t1 = (t0 + 5088U);
    t6 = *((char **)t1);
    t17 = *((int *)t6);
    t1 = (t0 + 5088U);
    t7 = *((char **)t1);
    t18 = *((int *)t7);
    t19 = (t18 * 2);
    t20 = (t19 - 1);
    if (t14 >= t17)
        goto LAB23;

LAB22:    t1 = (t0 + 5088U);
    t8 = *((char **)t1);
    t21 = *((int *)t8);
    t22 = (t21 * 2);
    t1 = (t0 + 5088U);
    t12 = *((char **)t1);
    t23 = *((int *)t12);
    t24 = (t23 * 3);
    t25 = (t24 - 1);
    if (t14 >= t22)
        goto LAB25;

LAB24:
LAB19:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 7776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(102, ng0);
    t1 = (t0 + 7840);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB15:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 5208U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    *((int *)t1) = 0;
    goto LAB11;

LAB13:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 5208U);
    t5 = *((char **)t1);
    t14 = *((int *)t5);
    t15 = (t14 + 1);
    t1 = (t0 + 5208U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    *((int *)t1) = t15;
    goto LAB11;

LAB16:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 7776);
    t13 = (t1 + 56U);
    t26 = *((char **)t13);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 7840);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB17:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 7776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 7840);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB18:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 7776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 7648);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB28:    xsi_set_current_line(99, ng0);
    t1 = (t0 + 7840);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB21:    if (t14 <= t16)
        goto LAB16;
    else
        goto LAB20;

LAB23:    if (t14 <= t20)
        goto LAB17;
    else
        goto LAB22;

LAB25:    if (t14 <= t25)
        goto LAB18;
    else
        goto LAB24;

LAB26:;
LAB27:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 7648);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB28;

}

static void work_a_3416056612_3665547200_p_1(char *t0)
{
    char t25[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    static char *nl0[] = {&&LAB17, &&LAB18, &&LAB19, &&LAB20, &&LAB21, &&LAB22, &&LAB23, &&LAB24, &&LAB25};
    static char *nl1[] = {&&LAB76, &&LAB71, &&LAB76, &&LAB72, &&LAB76, &&LAB73, &&LAB74, &&LAB76, &&LAB75};

LAB0:    xsi_set_current_line(110, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 7520);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(111, ng0);
    t1 = (t0 + 7904);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 7968);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(113, ng0);
    t1 = (t0 + 8032);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(114, ng0);
    t1 = (t0 + 8096);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(115, ng0);
    t1 = (t0 + 8160);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 8224);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 7;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 12952);
    t5 = (t0 + 8288);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 2952U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)3);
    if (t14 == 1)
        goto LAB13;

LAB14:    t12 = (unsigned char)0;

LAB15:    if (t12 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t10 = (t4 == (unsigned char)2);
    if (t10 == 1)
        goto LAB67;

LAB68:    t3 = (unsigned char)0;

LAB69:    if (t3 != 0)
        goto LAB65;

LAB66:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t3 = t11;
    goto LAB9;

LAB10:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2792U);
    t8 = *((char **)t2);
    t17 = *((unsigned char *)t8);
    t2 = (char *)((nl0) + t17);
    goto **((char **)t2);

LAB13:    t2 = (t0 + 3112U);
    t7 = *((char **)t2);
    t15 = *((unsigned char *)t7);
    t16 = (t15 == (unsigned char)2);
    t12 = t16;
    goto LAB15;

LAB16:    goto LAB11;

LAB17:    xsi_set_current_line(122, ng0);
    t9 = (t0 + 1352U);
    t18 = *((char **)t9);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)3);
    if (t20 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(128, ng0);
    t1 = (t0 + 7968);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(129, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB27:    goto LAB16;

LAB18:    xsi_set_current_line(132, ng0);
    t1 = (t0 + 7968);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(133, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 4392U);
    t5 = *((char **)t1);
    t27 = *((int *)t5);
    t28 = (t27 - 7);
    t26 = (t28 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t27);
    t29 = (1U * t26);
    t30 = (0 + t29);
    t1 = (t2 + t30);
    t3 = *((unsigned char *)t1);
    t6 = (t0 + 8096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t18 = *((char **)t9);
    *((unsigned char *)t18) = t3;
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(134, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB19:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t27 = *((int *)t2);
    t3 = (t27 == 0);
    if (t3 != 0)
        goto LAB31;

LAB33:    xsi_set_current_line(141, ng0);
    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t27 = *((int *)t2);
    t28 = (t27 - 1);
    t1 = (t0 + 8224);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t28;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(142, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 4392U);
    t5 = *((char **)t1);
    t27 = *((int *)t5);
    t28 = (t27 - 1);
    t31 = (t28 - 7);
    t26 = (t31 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t28);
    t29 = (1U * t26);
    t30 = (0 + t29);
    t1 = (t2 + t30);
    t3 = *((unsigned char *)t1);
    t6 = (t0 + 8096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t18 = *((char **)t9);
    *((unsigned char *)t18) = t3;
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(143, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB32:    goto LAB16;

LAB20:    xsi_set_current_line(146, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t27 = (0 - 7);
    t26 = (t27 * -1);
    t29 = (1U * t26);
    t30 = (0 + t29);
    t1 = (t2 + t30);
    t3 = *((unsigned char *)t1);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB34;

LAB36:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 8096);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(151, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);

LAB35:    goto LAB16;

LAB21:    xsi_set_current_line(154, ng0);
    t1 = (t0 + 7968);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(155, ng0);
    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t27 = *((int *)t2);
    t3 = (t27 == 0);
    if (t3 != 0)
        goto LAB37;

LAB39:    xsi_set_current_line(160, ng0);
    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t27 = *((int *)t2);
    t28 = (t27 - 1);
    t1 = (t0 + 8224);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t28;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(161, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 4392U);
    t5 = *((char **)t1);
    t27 = *((int *)t5);
    t28 = (t27 - 1);
    t31 = (t28 - 7);
    t26 = (t31 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t28);
    t29 = (1U * t26);
    t30 = (0 + t29);
    t1 = (t2 + t30);
    t3 = *((unsigned char *)t1);
    t6 = (t0 + 8096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t18 = *((char **)t9);
    *((unsigned char *)t18) = t3;
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(162, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);

LAB38:    goto LAB16;

LAB22:    xsi_set_current_line(165, ng0);
    t1 = (t0 + 7968);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(166, ng0);
    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t27 = *((int *)t2);
    t3 = (t27 == 0);
    if (t3 != 0)
        goto LAB40;

LAB42:    xsi_set_current_line(176, ng0);
    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t27 = *((int *)t2);
    t28 = (t27 - 1);
    t1 = (t0 + 8224);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t28;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(177, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);

LAB41:    goto LAB16;

LAB23:    xsi_set_current_line(180, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB49;

LAB51:    xsi_set_current_line(191, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)8;
    xsi_driver_first_trans_fast(t1);

LAB50:    goto LAB16;

LAB24:    xsi_set_current_line(194, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB57;

LAB59:    xsi_set_current_line(205, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)8;
    xsi_driver_first_trans_fast(t1);

LAB58:    goto LAB16;

LAB25:    xsi_set_current_line(208, ng0);
    t1 = (t0 + 7968);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(209, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB26:    xsi_set_current_line(123, ng0);
    t9 = (t0 + 7968);
    t21 = (t9 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(124, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t3 = *((unsigned char *)t5);
    t6 = ((IEEE_P_2592010699) + 4024);
    t7 = (t0 + 12740U);
    t1 = xsi_base_array_concat(t1, t25, t6, (char)97, t2, t7, (char)99, t3, (char)101);
    t26 = (7U + 1U);
    t4 = (8U != t26);
    if (t4 == 1)
        goto LAB29;

LAB30:    t8 = (t0 + 8352);
    t9 = (t8 + 56U);
    t18 = *((char **)t9);
    t21 = (t18 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(125, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 8416);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(126, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB27;

LAB29:    xsi_size_not_matching(8U, t26, 0);
    goto LAB30;

LAB31:    xsi_set_current_line(137, ng0);
    t1 = (t0 + 8096);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(138, ng0);
    t1 = (t0 + 8224);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 7;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(139, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB32;

LAB34:    xsi_set_current_line(147, ng0);
    t5 = (t0 + 4072U);
    t6 = *((char **)t5);
    t5 = (t0 + 4392U);
    t7 = *((char **)t5);
    t28 = *((int *)t7);
    t31 = (t28 - 7);
    t32 = (t31 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t28);
    t33 = (1U * t32);
    t34 = (0 + t33);
    t5 = (t6 + t34);
    t10 = *((unsigned char *)t5);
    t8 = (t0 + 8096);
    t9 = (t8 + 56U);
    t18 = *((char **)t9);
    t21 = (t18 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t10;
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(148, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB35;

LAB37:    xsi_set_current_line(156, ng0);
    t1 = (t0 + 8096);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(157, ng0);
    t1 = (t0 + 8224);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 7;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(158, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB38;

LAB40:    xsi_set_current_line(167, ng0);
    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB46;

LAB47:    t4 = (unsigned char)0;

LAB48:    if (t4 != 0)
        goto LAB43;

LAB45:    xsi_set_current_line(170, ng0);
    t1 = (t0 + 8096);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB44:    xsi_set_current_line(172, ng0);
    t1 = (t0 + 8224);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 7;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(173, ng0);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t1 = (t0 + 8288);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(174, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)7;
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB43:    xsi_set_current_line(168, ng0);
    t22 = (t0 + 8096);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t35 = (t24 + 56U);
    t36 = *((char **)t35);
    *((unsigned char *)t36) = (unsigned char)2;
    xsi_driver_first_trans_fast(t22);
    goto LAB44;

LAB46:    t1 = (t0 + 3912U);
    t6 = *((char **)t1);
    t1 = (t0 + 12788U);
    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 1672U);
    t9 = *((char **)t7);
    t12 = *((unsigned char *)t9);
    t18 = ((IEEE_P_2592010699) + 4024);
    t21 = (t0 + 12740U);
    t7 = xsi_base_array_concat(t7, t25, t18, (char)97, t8, t21, (char)99, t12, (char)101);
    t13 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t6, t1, t7, t25);
    t4 = t13;
    goto LAB48;

LAB49:    xsi_set_current_line(181, ng0);
    t1 = (t0 + 7968);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(182, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t3 = *((unsigned char *)t5);
    t6 = ((IEEE_P_2592010699) + 4024);
    t7 = (t0 + 12740U);
    t1 = xsi_base_array_concat(t1, t25, t6, (char)97, t2, t7, (char)99, t3, (char)101);
    t26 = (7U + 1U);
    t4 = (8U != t26);
    if (t4 == 1)
        goto LAB52;

LAB53:    t8 = (t0 + 8352);
    t9 = (t8 + 56U);
    t18 = *((char **)t9);
    t21 = (t18 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(183, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 8416);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(184, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 12788U);
    t5 = (t0 + 1512U);
    t6 = *((char **)t5);
    t5 = (t0 + 1672U);
    t7 = *((char **)t5);
    t3 = *((unsigned char *)t7);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t0 + 12740U);
    t5 = xsi_base_array_concat(t5, t25, t8, (char)97, t6, t9, (char)99, t3, (char)101);
    t4 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t25);
    if (t4 != 0)
        goto LAB54;

LAB56:    xsi_set_current_line(188, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB55:    goto LAB50;

LAB52:    xsi_size_not_matching(8U, t26, 0);
    goto LAB53;

LAB54:    xsi_set_current_line(185, ng0);
    t18 = (t0 + 1832U);
    t21 = *((char **)t18);
    t18 = (t0 + 4392U);
    t22 = *((char **)t18);
    t27 = *((int *)t22);
    t28 = (t27 - 7);
    t26 = (t28 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t27);
    t29 = (1U * t26);
    t30 = (0 + t29);
    t18 = (t21 + t30);
    t10 = *((unsigned char *)t18);
    t23 = (t0 + 8096);
    t24 = (t23 + 56U);
    t35 = *((char **)t24);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    *((unsigned char *)t37) = t10;
    xsi_driver_first_trans_fast(t23);
    xsi_set_current_line(186, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB55;

LAB57:    xsi_set_current_line(195, ng0);
    t1 = (t0 + 7968);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(196, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t3 = *((unsigned char *)t5);
    t6 = ((IEEE_P_2592010699) + 4024);
    t7 = (t0 + 12740U);
    t1 = xsi_base_array_concat(t1, t25, t6, (char)97, t2, t7, (char)99, t3, (char)101);
    t26 = (7U + 1U);
    t4 = (8U != t26);
    if (t4 == 1)
        goto LAB60;

LAB61:    t8 = (t0 + 8352);
    t9 = (t8 + 56U);
    t18 = *((char **)t9);
    t21 = (t18 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(197, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 8416);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(198, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 12788U);
    t5 = (t0 + 1512U);
    t6 = *((char **)t5);
    t5 = (t0 + 1672U);
    t7 = *((char **)t5);
    t3 = *((unsigned char *)t7);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t0 + 12740U);
    t5 = xsi_base_array_concat(t5, t25, t8, (char)97, t6, t9, (char)99, t3, (char)101);
    t4 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t25);
    if (t4 != 0)
        goto LAB62;

LAB64:    xsi_set_current_line(202, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB63:    goto LAB58;

LAB60:    xsi_size_not_matching(8U, t26, 0);
    goto LAB61;

LAB62:    xsi_set_current_line(199, ng0);
    t18 = (t0 + 8096);
    t21 = (t18 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_fast(t18);
    xsi_set_current_line(200, ng0);
    t1 = (t0 + 7904);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB63;

LAB65:    xsi_set_current_line(212, ng0);
    t1 = (t0 + 2792U);
    t6 = *((char **)t1);
    t13 = *((unsigned char *)t6);
    t1 = (char *)((nl1) + t13);
    goto **((char **)t1);

LAB67:    t1 = (t0 + 3112U);
    t5 = *((char **)t1);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB69;

LAB70:    goto LAB11;

LAB71:    xsi_set_current_line(214, ng0);
    t7 = (t0 + 3432U);
    t8 = *((char **)t7);
    t14 = *((unsigned char *)t8);
    t15 = (t14 == (unsigned char)2);
    if (t15 != 0)
        goto LAB77;

LAB79:
LAB78:    goto LAB70;

LAB72:    xsi_set_current_line(219, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t10 = (t4 != (unsigned char)2);
    if (t10 == 1)
        goto LAB83;

LAB84:    t1 = (t0 + 2312U);
    t5 = *((char **)t1);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;

LAB85:    if (t3 != 0)
        goto LAB80;

LAB82:
LAB81:    goto LAB70;

LAB73:    xsi_set_current_line(223, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4392U);
    t5 = *((char **)t1);
    t27 = *((int *)t5);
    t28 = (t27 - 7);
    t26 = (t28 * -1);
    t29 = (1 * t26);
    t30 = (0U + t29);
    t1 = (t0 + 8480);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t3;
    xsi_driver_first_trans_delta(t1, t30, 1, 0LL);
    goto LAB70;

LAB74:    xsi_set_current_line(225, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t10 = (t4 != (unsigned char)2);
    if (t10 == 1)
        goto LAB89;

LAB90:    t1 = (t0 + 2312U);
    t5 = *((char **)t1);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;

LAB91:    if (t3 != 0)
        goto LAB86;

LAB88:
LAB87:    goto LAB70;

LAB75:    xsi_set_current_line(229, ng0);
    t1 = (t0 + 8032);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB70;

LAB76:    xsi_set_current_line(231, ng0);
    goto LAB70;

LAB77:    xsi_set_current_line(215, ng0);
    t7 = (t0 + 8032);
    t9 = (t7 + 56U);
    t18 = *((char **)t9);
    t21 = (t18 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(216, ng0);
    t1 = (t0 + 8160);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB78;

LAB80:    xsi_set_current_line(220, ng0);
    t1 = (t0 + 8160);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB81;

LAB83:    t3 = (unsigned char)1;
    goto LAB85;

LAB86:    xsi_set_current_line(226, ng0);
    t1 = (t0 + 8160);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB87;

LAB89:    t3 = (unsigned char)1;
    goto LAB91;

}

static void work_a_3416056612_3665547200_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    static char *nl0[] = {&&LAB7, &&LAB5, &&LAB7, &&LAB7, &&LAB7, &&LAB7, &&LAB7, &&LAB7, &&LAB6};

LAB0:    t1 = (t0 + 6688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(238, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(238, ng0);

LAB10:    t2 = (t0 + 7536);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB5:    xsi_set_current_line(239, ng0);
    t5 = (t0 + 3112U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t5 = (t0 + 8544);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB6:    xsi_set_current_line(239, ng0);
    t2 = (t0 + 3112U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t7 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t4);
    t2 = (t0 + 8544);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t7;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    xsi_set_current_line(239, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (t0 + 8544);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB8:    t3 = (t0 + 7536);
    *((int *)t3) = 0;
    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_3416056612_3665547200_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(244, ng0);
    t2 = (t0 + 3432U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t13 = (t0 + 8608);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 7552);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t2 = (t0 + 8608);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB2;

LAB5:    t2 = (t0 + 3272U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_3416056612_3665547200_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(245, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 8672);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);

LAB2:    t14 = (t0 + 7568);
    *((int *)t14) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 8672);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_3416056612_3665547200_init()
{
	static char *pe[] = {(void *)work_a_3416056612_3665547200_p_0,(void *)work_a_3416056612_3665547200_p_1,(void *)work_a_3416056612_3665547200_p_2,(void *)work_a_3416056612_3665547200_p_3,(void *)work_a_3416056612_3665547200_p_4};
	xsi_register_didat("work_a_3416056612_3665547200", "isim/TbI2c_isim_beh.exe.sim/work/a_3416056612_3665547200.didat");
	xsi_register_executes(pe);
}
