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
static const char *ng0 = "C:/Users/Sylvain/workspace/MojoV3/ise_files/i2c_ram_interface.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_2695113304_3212880686_p_0(char *t0)
{
    char t22[16];
    char t23[16];
    char t28[16];
    char t29[16];
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
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t30;
    char *t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    int t39;
    int t40;
    int t41;
    int t42;
    int t43;
    int t44;
    int t45;
    int t46;
    int t47;
    int t48;
    int t49;
    int t50;
    int t51;
    int t52;
    int t53;
    int t54;
    int t55;
    int t56;
    int t57;
    int t58;
    int t59;
    int t60;
    int t61;
    int t62;
    int t63;
    int t64;
    unsigned int t65;
    static char *nl0[] = {&&LAB15, &&LAB17, &&LAB16, &&LAB18, &&LAB19, &&LAB20, &&LAB21, &&LAB22};

LAB0:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 7240);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(117, ng0);
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
LAB9:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 4072U);
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

LAB8:    xsi_set_current_line(118, ng0);
    t4 = (t0 + 7336);
    t15 = (t4 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    t4 = (t0 + 4072U);
    t12 = *((char **)t4);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)0);
    t8 = t14;
    goto LAB13;

LAB14:    goto LAB3;

LAB15:    xsi_set_current_line(123, ng0);
    t5 = (t0 + 13213);
    t12 = (t0 + 7400);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 13245);
    t5 = (t0 + 7464);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 7528);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 7592);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 13249);
    t5 = (t0 + 7656);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB16:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 13257);
    t5 = (t0 + 7400);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 13289);
    t5 = (t0 + 7464);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 7336);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 13293);
    t5 = (t0 + 7656);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB17:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 7720);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 13301);
    t5 = (t0 + 7400);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 13333);
    t5 = (t0 + 7464);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t19 = (31 - 31);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t9 = ((IEEE_P_2592010699) + 4024);
    t12 = (t23 + 0U);
    t15 = (t12 + 0U);
    *((int *)t15) = 31;
    t15 = (t12 + 4U);
    *((int *)t15) = 4;
    t15 = (t12 + 8U);
    *((int *)t15) = -1;
    t24 = (4 - 31);
    t25 = (t24 * -1);
    t25 = (t25 + 1);
    t15 = (t12 + 12U);
    *((unsigned int *)t15) = t25;
    t5 = xsi_base_array_concat(t5, t22, t9, (char)97, t2, t23, (char)99, (unsigned char)3, (char)101);
    t15 = (t0 + 1672U);
    t16 = *((char **)t15);
    t25 = (31 - 2);
    t26 = (t25 * 1U);
    t27 = (0 + t26);
    t15 = (t16 + t27);
    t18 = ((IEEE_P_2592010699) + 4024);
    t30 = (t29 + 0U);
    t31 = (t30 + 0U);
    *((int *)t31) = 2;
    t31 = (t30 + 4U);
    *((int *)t31) = 0;
    t31 = (t30 + 8U);
    *((int *)t31) = -1;
    t32 = (0 - 2);
    t33 = (t32 * -1);
    t33 = (t33 + 1);
    t31 = (t30 + 12U);
    *((unsigned int *)t31) = t33;
    t17 = xsi_base_array_concat(t17, t28, t18, (char)97, t5, t22, (char)97, t15, t29, (char)101);
    t33 = (28U + 1U);
    t34 = (t33 + 3U);
    t1 = (32U != t34);
    if (t1 == 1)
        goto LAB24;

LAB25:    t31 = (t0 + 7784);
    t35 = (t31 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t17, 32U);
    xsi_driver_first_trans_fast_port(t31);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 7336);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB18:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 13337);
    t5 = (t0 + 7464);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t24 = (1 - 31);
    t19 = (t24 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t1 = *((unsigned char *)t2);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB26;

LAB28:
LAB27:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 7336);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)4;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 13373);
    t5 = (t0 + 7656);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB19:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 7848);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 7336);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)5;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 13381);
    t5 = (t0 + 7656);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB20:    xsi_set_current_line(161, ng0);
    t2 = (t0 + 7912);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 7976);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 4232U);
    t4 = *((char **)t2);
    t19 = (31 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t0 + 8040);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 7528);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 7592);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(166, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB29;

LAB31:
LAB30:    xsi_set_current_line(171, ng0);
    t2 = (t0 + 13389);
    t5 = (t0 + 7656);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB21:    xsi_set_current_line(174, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)2);
    if (t3 != 0)
        goto LAB32;

LAB34:
LAB33:    xsi_set_current_line(183, ng0);
    t2 = (t0 + 4392U);
    t4 = *((char **)t2);
    t2 = (t0 + 5192U);
    t5 = *((char **)t2);
    t24 = *((int *)t5);
    t32 = (8 * t24);
    t39 = (t32 + 7);
    t19 = (31 - t39);
    t2 = (t0 + 5192U);
    t9 = *((char **)t2);
    t40 = *((int *)t9);
    t41 = (8 * t40);
    xsi_vhdl_check_range_of_slice(31, 0, -1, t39, t41, -1);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t12 = (t0 + 5192U);
    t15 = *((char **)t12);
    t42 = *((int *)t15);
    t43 = (8 * t42);
    t44 = (t43 + 7);
    t12 = (t0 + 5192U);
    t16 = *((char **)t12);
    t45 = *((int *)t16);
    t46 = (8 * t45);
    t47 = (t46 - t44);
    t25 = (t47 * -1);
    t25 = (t25 + 1);
    t26 = (1U * t25);
    t1 = (8U != t26);
    if (t1 == 1)
        goto LAB42;

LAB43:    t12 = (t0 + 8040);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    t30 = (t18 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t2, 8U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(184, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 5192U);
    t5 = *((char **)t2);
    t24 = *((int *)t5);
    t32 = (t24 - 1);
    t39 = (8 * t32);
    t40 = (t39 + 7);
    t2 = (t0 + 5192U);
    t9 = *((char **)t2);
    t41 = *((int *)t9);
    t42 = (t41 - 1);
    t43 = (8 * t42);
    t44 = (t43 - t40);
    t19 = (t44 * -1);
    t19 = (t19 + 1);
    t20 = (1U * t19);
    t1 = (t20 != 8U);
    if (t1 == 1)
        goto LAB44;

LAB45:    t2 = (t0 + 5192U);
    t12 = *((char **)t2);
    t45 = *((int *)t12);
    t46 = (t45 - 1);
    t47 = (8 * t46);
    t48 = (t47 + 7);
    t21 = (31 - t48);
    t25 = (1U * t21);
    t26 = (0U + t25);
    t2 = (t0 + 8168);
    t15 = (t2 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t30 = (t0 + 5192U);
    t31 = *((char **)t30);
    t49 = *((int *)t31);
    t50 = (t49 - 1);
    t51 = (8 * t50);
    t52 = (t51 + 7);
    t30 = (t0 + 5192U);
    t35 = *((char **)t30);
    t53 = *((int *)t35);
    t54 = (t53 - 1);
    t55 = (8 * t54);
    t56 = (t55 - t52);
    t27 = (t56 * -1);
    t27 = (t27 + 1);
    t33 = (1U * t27);
    memcpy(t18, t4, t33);
    t30 = (t0 + 5192U);
    t36 = *((char **)t30);
    t57 = *((int *)t36);
    t58 = (t57 - 1);
    t59 = (8 * t58);
    t60 = (t59 + 7);
    t30 = (t0 + 5192U);
    t37 = *((char **)t30);
    t61 = *((int *)t37);
    t62 = (t61 - 1);
    t63 = (8 * t62);
    t64 = (t63 - t60);
    t34 = (t64 * -1);
    t34 = (t34 + 1);
    t65 = (1U * t34);
    xsi_driver_first_trans_delta(t2, t26, t65, 0LL);
    goto LAB14;

LAB22:    xsi_set_current_line(187, ng0);
    t2 = (t0 + 13413);
    t5 = (t0 + 7464);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(188, ng0);
    t2 = (t0 + 13417);
    t5 = (t0 + 7400);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(189, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t2 = (t0 + 7784);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(190, ng0);
    t2 = (t0 + 7336);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(191, ng0);
    t2 = (t0 + 13449);
    t5 = (t0 + 7656);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB14;

LAB23:    xsi_set_current_line(193, ng0);
    goto LAB14;

LAB24:    xsi_size_not_matching(32U, t34, 0);
    goto LAB25;

LAB26:    xsi_set_current_line(145, ng0);
    t5 = (t0 + 13341);
    t12 = (t0 + 7400);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB27;

LAB29:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 7336);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = (unsigned char)6;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 4232U);
    t4 = *((char **)t2);
    t24 = (1 - 31);
    t19 = (t24 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 7912);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 4232U);
    t4 = *((char **)t2);
    t24 = (1 - 31);
    t19 = (t24 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t1 = *((unsigned char *)t2);
    t3 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t1);
    t5 = (t0 + 7976);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t3;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB30;

LAB32:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 5192U);
    t5 = *((char **)t2);
    t24 = *((int *)t5);
    t6 = (t24 == 1);
    if (t6 != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(179, ng0);
    t2 = (t0 + 5192U);
    t4 = *((char **)t2);
    t24 = *((int *)t4);
    t32 = (t24 - 1);
    t2 = (t0 + 8104);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((int *)t15) = t32;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 13405);
    t1 = (8U != 8U);
    if (t1 == 1)
        goto LAB40;

LAB41:    t5 = (t0 + 7656);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_delta(t5, 0U, 8U, 0LL);

LAB36:    goto LAB33;

LAB35:    xsi_set_current_line(176, ng0);
    t2 = (t0 + 7336);
    t9 = (t2 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)7;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(177, ng0);
    t2 = (t0 + 13397);
    t1 = (8U != 8U);
    if (t1 == 1)
        goto LAB38;

LAB39:    t5 = (t0 + 7656);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_delta(t5, 0U, 8U, 0LL);
    goto LAB36;

LAB38:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB39;

LAB40:    xsi_size_not_matching(8U, 8U, 0);
    goto LAB41;

LAB42:    xsi_size_not_matching(8U, t26, 0);
    goto LAB43;

LAB44:    xsi_size_not_matching(t20, 8U, 0);
    goto LAB45;

}

static void work_a_2695113304_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;

LAB0:    xsi_set_current_line(201, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 7256);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(202, ng0);
    t4 = (t0 + 5032U);
    t8 = *((char **)t4);
    t9 = *((int *)t8);
    t10 = (t9 < 167);
    if (t10 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 5032U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t1 = (t9 > 166);
    if (t1 != 0)
        goto LAB11;

LAB12:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(203, ng0);
    t4 = (t0 + 8232);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(204, ng0);
    t2 = (t0 + 5032U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t15 = (t9 + 1);
    t2 = (t0 + 8296);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t15;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

LAB11:    xsi_set_current_line(206, ng0);
    t2 = (t0 + 8232);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(207, ng0);
    t2 = (t0 + 8296);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

}


extern void work_a_2695113304_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2695113304_3212880686_p_0,(void *)work_a_2695113304_3212880686_p_1};
	xsi_register_didat("work_a_2695113304_3212880686", "isim/TbI2CRamInterface_isim_beh.exe.sim/work/a_2695113304_3212880686.didat");
	xsi_register_executes(pe);
}
