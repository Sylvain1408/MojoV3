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
static const char *ng0 = "C:/Users/CAO-PCB/Documents/MojoV3/ise_files/ram_interface.vhd";



static void work_a_2736283073_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    static char *nl0[] = {&&LAB9, &&LAB11, &&LAB10};

LAB0:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5552);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(75, ng0);
    t4 = (t0 + 3912U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t4 = (char *)((nl0) + t9);
    goto **((char **)t4);

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(117, ng0);
    t2 = (t0 + 3432U);
    t4 = *((char **)t2);
    t21 = (31 - 7);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t2 = (t4 + t23);
    t5 = (t0 + 6144);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB3;

LAB9:    xsi_set_current_line(77, ng0);
    t10 = (t0 + 2312U);
    t11 = *((char **)t10);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)3);
    if (t13 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 9679);
    t5 = (t0 + 5696);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 9683);
    t5 = (t0 + 5888);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 9715);
    t5 = (t0 + 5632);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 9747);
    t5 = (t0 + 6016);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 6080);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 5760);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 5952);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);

LAB14:    goto LAB8;

LAB10:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 5952);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

LAB11:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3272U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB21;

LAB23:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 6080);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t2 = (t0 + 6016);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_fast_port(t2);

LAB22:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 5952);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

LAB12:    xsi_set_current_line(115, ng0);
    goto LAB8;

LAB13:    xsi_set_current_line(78, ng0);
    t10 = (t0 + 9659);
    t15 = (16U != 16U);
    if (t15 == 1)
        goto LAB16;

LAB17:    t16 = (t0 + 5632);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t10, 16U);
    xsi_driver_first_trans_delta(t16, 0U, 16U, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t21 = (31 - 15);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t2 = (t4 + t23);
    t5 = (t0 + 5632);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 16U);
    xsi_driver_first_trans_delta(t5, 16U, 16U, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB18;

LAB20:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 5952);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB19:    goto LAB14;

LAB16:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB17;

LAB18:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 9675);
    t8 = (t0 + 5696);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t14 = (t11 + 56U);
    t16 = *((char **)t14);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 5760);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 5824);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 5888);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 5952);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB19;

LAB21:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 6080);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 9779);
    t5 = (t0 + 5696);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB22;

}


extern void work_a_2736283073_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2736283073_3212880686_p_0};
	xsi_register_didat("work_a_2736283073_3212880686", "isim/TbRamInterface_isim_beh.exe.sim/work/a_2736283073_3212880686.didat");
	xsi_register_executes(pe);
}
