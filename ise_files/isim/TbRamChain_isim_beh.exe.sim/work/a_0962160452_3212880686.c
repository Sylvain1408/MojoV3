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
static const char *ng0 = "E:/workspace/Mojo-Base-VHDL/ise_files/RamChain.vhd";



static void work_a_0962160452_3212880686_p_0(char *t0)
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

LAB0:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 6032);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(102, ng0);
    t4 = (t0 + 3592U);
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

LAB8:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 3112U);
    t4 = *((char **)t2);
    t21 = (31 - 7);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t2 = (t4 + t23);
    t5 = (t0 + 6624);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB3;

LAB9:    xsi_set_current_line(104, ng0);
    t10 = (t0 + 2312U);
    t11 = *((char **)t10);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)3);
    if (t13 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 10542);
    t5 = (t0 + 6176);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 4U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 10546);
    t5 = (t0 + 6368);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 10578);
    t5 = (t0 + 6112);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 10610);
    t5 = (t0 + 6496);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 6560);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 6240);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 6432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);

LAB14:    goto LAB8;

LAB10:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 6432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

LAB11:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 4072U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB21;

LAB23:    xsi_set_current_line(146, ng0);
    t2 = (t0 + 6560);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 3112U);
    t4 = *((char **)t2);
    t2 = (t0 + 6496);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_fast_port(t2);

LAB22:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 6432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

LAB12:    xsi_set_current_line(161, ng0);
    goto LAB8;

LAB13:    xsi_set_current_line(105, ng0);
    t10 = (t0 + 10522);
    t15 = (16U != 16U);
    if (t15 == 1)
        goto LAB16;

LAB17:    t16 = (t0 + 6112);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t10, 16U);
    xsi_driver_first_trans_delta(t16, 0U, 16U, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t21 = (31 - 15);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t2 = (t4 + t23);
    t5 = (t0 + 6112);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 16U);
    xsi_driver_first_trans_delta(t5, 16U, 16U, 0LL);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB18;

LAB20:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 6432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB19:    goto LAB14;

LAB16:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB17;

LAB18:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 10538);
    t8 = (t0 + 6176);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t14 = (t11 + 56U);
    t16 = *((char **)t14);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 6240);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 6304);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 6368);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 6432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB19;

LAB21:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 6560);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 10642);
    t5 = (t0 + 6176);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 4U);
    xsi_driver_first_trans_fast(t5);
    goto LAB22;

}


extern void work_a_0962160452_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0962160452_3212880686_p_0};
	xsi_register_didat("work_a_0962160452_3212880686", "isim/TbRamChain_isim_beh.exe.sim/work/a_0962160452_3212880686.didat");
	xsi_register_executes(pe);
}
