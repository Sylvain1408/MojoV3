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
static const char *ng0 = "C:/Users/CAO-PCB/Documents/MojoV3/ise_files/i2c_ram_interface.vhd";



static void work_a_2695113304_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    static char *nl0[] = {&&LAB15, &&LAB16, &&LAB17, &&LAB18, &&LAB19, &&LAB20, &&LAB21};

LAB0:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 6920);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(95, ng0);
    t4 = (t0 + 3112U);
    t9 = *((char **)t4);
    t10 = *((unsigned char *)t9);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB11;

LAB12:    t8 = (unsigned char)0;

LAB13:    if (t8 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 3912U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (char *)((nl0) + t1);
    goto **((char **)t2);

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(96, ng0);
    t4 = (t0 + 7016);
    t15 = (t4 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)1;
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    t4 = (t0 + 3912U);
    t12 = *((char **)t4);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)0);
    t8 = t14;
    goto LAB13;

LAB14:    goto LAB3;

LAB15:    xsi_set_current_line(101, ng0);
    t5 = (t0 + 12184);
    t12 = (t0 + 7080);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 12216);
    t5 = (t0 + 7144);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 7208);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 7272);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((int *)t12) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 12220);
    t5 = (t0 + 7336);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB16:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 12228);
    t5 = (t0 + 7080);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 12260);
    t5 = (t0 + 7144);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 7016);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 12264);
    t5 = (t0 + 7336);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB17:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 7400);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 7016);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)4;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t19 = (1 - 31);
    t20 = (t19 * -1);
    t21 = (1U * t20);
    t22 = (0 + t21);
    t2 = (t4 + t22);
    t1 = *((unsigned char *)t2);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB23;

LAB25:
LAB24:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 7016);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 12308);
    t5 = (t0 + 7336);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB18:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 7464);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 7016);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)4;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 12316);
    t5 = (t0 + 7336);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB19:    goto LAB14;

LAB20:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 7016);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)6;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 12324);
    t1 = (8U != 8U);
    if (t1 == 1)
        goto LAB26;

LAB27:    t5 = (t0 + 7336);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_delta(t5, 0U, 8U, 0LL);
    goto LAB14;

LAB21:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 7016);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 12332);
    t5 = (t0 + 7336);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB22:    xsi_set_current_line(138, ng0);
    goto LAB14;

LAB23:    xsi_set_current_line(117, ng0);
    t5 = (t0 + 12272);
    t12 = (t0 + 7080);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 12304);
    t5 = (t0 + 7144);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB24;

LAB26:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB27;

}

static void work_a_2695113304_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;

LAB0:    xsi_set_current_line(146, ng0);
    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 < 167);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 > 167);
    if (t4 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 6936);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(147, ng0);
    t1 = (t0 + 7528);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(148, ng0);
    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t9 = (t3 + 1);
    t1 = (t0 + 7592);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t9;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 7528);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(151, ng0);
    t1 = (t0 + 7592);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 1;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}


extern void work_a_2695113304_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2695113304_3212880686_p_0,(void *)work_a_2695113304_3212880686_p_1};
	xsi_register_didat("work_a_2695113304_3212880686", "isim/TbI2c_isim_beh.exe.sim/work/a_2695113304_3212880686.didat");
	xsi_register_executes(pe);
}
