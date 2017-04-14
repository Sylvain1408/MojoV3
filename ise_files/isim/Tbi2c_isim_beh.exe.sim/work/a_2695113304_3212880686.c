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
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_2695113304_3212880686_p_0(char *t0)
{
    char t22[16];
    char t23[16];
    char t28[16];
    char t29[16];
    char t69[16];
    char t71[16];
    char t76[16];
    char t78[16];
    char t83[16];
    char t85[16];
    char t91[16];
    char t93[16];
    char t97[16];
    char t104[16];
    char t106[16];
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
    int t65;
    int t66;
    int t67;
    unsigned int t68;
    char *t70;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t77;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t84;
    char *t86;
    char *t87;
    unsigned int t88;
    char *t90;
    char *t92;
    char *t94;
    char *t95;
    char *t96;
    char *t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    char *t105;
    char *t107;
    char *t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    char *t117;
    char *t118;
    char *t119;
    char *t120;
    static char *nl0[] = {&&LAB15, &&LAB17, &&LAB16, &&LAB18, &&LAB19, &&LAB20, &&LAB24, &&LAB21, &&LAB22, &&LAB23};

LAB0:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8360);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(140, ng0);
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
LAB9:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 4392U);
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

LAB8:    xsi_set_current_line(141, ng0);
    t4 = (t0 + 8456);
    t15 = (t4 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    t4 = (t0 + 4392U);
    t12 = *((char **)t4);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)0);
    t8 = t14;
    goto LAB13;

LAB14:    xsi_set_current_line(250, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 9416);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(251, ng0);
    t2 = (t0 + 3592U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 9480);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(252, ng0);
    t2 = (t0 + 3432U);
    t4 = *((char **)t2);
    t2 = (t0 + 9544);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 3U);
    xsi_driver_first_trans_delta(t2, 5U, 3U, 0LL);
    goto LAB3;

LAB15:    xsi_set_current_line(146, ng0);
    t5 = (t0 + 15386);
    t12 = (t0 + 8520);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 15418);
    t5 = (t0 + 8584);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 8648);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 8712);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 8776);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 15422);
    t5 = (t0 + 8840);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    goto LAB14;

LAB16:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 15454);
    t5 = (t0 + 8520);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 15486);
    t5 = (t0 + 8584);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB17:    xsi_set_current_line(161, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 8904);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 15490);
    t5 = (t0 + 8520);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 15522);
    t5 = (t0 + 8584);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(164, ng0);
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
        goto LAB25;

LAB26:    t31 = (t0 + 8968);
    t35 = (t31 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t17, 32U);
    xsi_driver_first_trans_fast_port(t31);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB18:    xsi_set_current_line(168, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 8904);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 15526);
    t5 = (t0 + 8584);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(170, ng0);
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
        goto LAB27;

LAB29:
LAB28:    xsi_set_current_line(173, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)4;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB19:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 9032);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(178, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)5;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t19 = (31 - 6);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t22 + 0U);
    t9 = (t5 + 0U);
    *((int *)t9) = 6;
    t9 = (t5 + 4U);
    *((int *)t9) = 4;
    t9 = (t5 + 8U);
    *((int *)t9) = -1;
    t24 = (4 - 6);
    t25 = (t24 * -1);
    t25 = (t25 + 1);
    t9 = (t5 + 12U);
    *((unsigned int *)t9) = t25;
    t32 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t22);
    t1 = (t32 > 4);
    if (t1 != 0)
        goto LAB30;

LAB32:    xsi_set_current_line(183, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t19 = (31 - 6);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t22 + 0U);
    t9 = (t5 + 0U);
    *((int *)t9) = 6;
    t9 = (t5 + 4U);
    *((int *)t9) = 4;
    t9 = (t5 + 8U);
    *((int *)t9) = -1;
    t24 = (4 - 6);
    t25 = (t24 * -1);
    t25 = (t25 + 1);
    t9 = (t5 + 12U);
    *((unsigned int *)t9) = t25;
    t32 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t22);
    t1 = (t32 == 0);
    if (t1 != 0)
        goto LAB33;

LAB35:
LAB34:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t19 = (31 - 6);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t22 + 0U);
    t9 = (t5 + 0U);
    *((int *)t9) = 6;
    t9 = (t5 + 4U);
    *((int *)t9) = 4;
    t9 = (t5 + 8U);
    *((int *)t9) = -1;
    t24 = (4 - 6);
    t25 = (t24 * -1);
    t25 = (t25 + 1);
    t9 = (t5 + 12U);
    *((unsigned int *)t9) = t25;
    t32 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t22);
    t9 = (t0 + 9096);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((int *)t17) = t32;
    xsi_driver_first_trans_fast(t9);

LAB31:    goto LAB14;

LAB20:    xsi_set_current_line(190, ng0);
    t2 = (t0 + 9160);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(191, ng0);
    t2 = (t0 + 9224);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(192, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t19 = (31 - 14);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t0 + 9288);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 7U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(194, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t19 = (31 - 23);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t0 + 9352);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(195, ng0);
    t2 = (t0 + 8648);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(196, ng0);
    t2 = (t0 + 8712);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(197, ng0);
    t2 = (t0 + 4232U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)3);
    if (t6 == 1)
        goto LAB39;

LAB40:    t1 = (unsigned char)0;

LAB41:    if (t1 != 0)
        goto LAB36;

LAB38:
LAB37:    goto LAB14;

LAB21:    xsi_set_current_line(207, ng0);
    t2 = (t0 + 4232U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)3);
    if (t6 == 1)
        goto LAB45;

LAB46:    t1 = (unsigned char)0;

LAB47:    if (t1 != 0)
        goto LAB42;

LAB44:
LAB43:    xsi_set_current_line(217, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB51;

LAB53:
LAB52:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 4712U);
    t4 = *((char **)t2);
    t2 = (t0 + 5352U);
    t5 = *((char **)t2);
    t24 = *((int *)t5);
    t32 = (8 * t24);
    t39 = (t32 - 1);
    t19 = (31 - t39);
    t2 = (t0 + 5352U);
    t9 = *((char **)t2);
    t40 = *((int *)t9);
    t41 = (8 * t40);
    t42 = (t41 - 8);
    xsi_vhdl_check_range_of_slice(31, 0, -1, t39, t42, -1);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t12 = (t0 + 5352U);
    t15 = *((char **)t12);
    t43 = *((int *)t15);
    t44 = (8 * t43);
    t45 = (t44 - 1);
    t12 = (t0 + 5352U);
    t16 = *((char **)t12);
    t46 = *((int *)t16);
    t47 = (8 * t46);
    t48 = (t47 - 8);
    t49 = (t48 - t45);
    t25 = (t49 * -1);
    t25 = (t25 + 1);
    t26 = (1U * t25);
    t1 = (8U != t26);
    if (t1 == 1)
        goto LAB56;

LAB57:    t12 = (t0 + 9352);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    t30 = (t18 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t2, 8U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB14;

LAB22:    xsi_set_current_line(225, ng0);
    t2 = (t0 + 4232U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)3);
    if (t6 == 1)
        goto LAB61;

LAB62:    t1 = (unsigned char)0;

LAB63:    if (t1 != 0)
        goto LAB58;

LAB60:
LAB59:    xsi_set_current_line(236, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB66;

LAB68:
LAB67:    goto LAB14;

LAB23:    xsi_set_current_line(242, ng0);
    t2 = (t0 + 15605);
    t5 = (t0 + 8584);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(243, ng0);
    t2 = (t0 + 15609);
    t5 = (t0 + 8520);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(244, ng0);
    t2 = (t0 + 4872U);
    t4 = *((char **)t2);
    t2 = (t0 + 8968);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(245, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB24:    xsi_set_current_line(248, ng0);
    goto LAB14;

LAB25:    xsi_size_not_matching(32U, t34, 0);
    goto LAB26;

LAB27:    xsi_set_current_line(171, ng0);
    t5 = (t0 + 15530);
    t12 = (t0 + 8520);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB28;

LAB30:    xsi_set_current_line(180, ng0);
    t9 = (t0 + 9096);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((int *)t17) = 4;
    xsi_driver_first_trans_fast(t9);
    goto LAB31;

LAB33:    xsi_set_current_line(184, ng0);
    t9 = (t0 + 9096);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((int *)t17) = 1;
    xsi_driver_first_trans_fast(t9);
    goto LAB34;

LAB36:    xsi_set_current_line(198, ng0);
    t2 = (t0 + 8456);
    t9 = (t2 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)7;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(199, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t24 = (1 - 31);
    t19 = (t24 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 9160);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(200, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t24 = (1 - 31);
    t19 = (t24 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t1 = *((unsigned char *)t2);
    t3 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t1);
    t5 = (t0 + 9224);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t3;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(201, ng0);
    t2 = (t0 + 4712U);
    t4 = *((char **)t2);
    t19 = (31 - 31);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t0 + 9352);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB37;

LAB39:    t2 = (t0 + 2632U);
    t5 = *((char **)t2);
    t7 = *((unsigned char *)t5);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB41;

LAB42:    xsi_set_current_line(208, ng0);
    t2 = (t0 + 5352U);
    t9 = *((char **)t2);
    t24 = *((int *)t9);
    t10 = (t24 > 1);
    if (t10 != 0)
        goto LAB48;

LAB50:    xsi_set_current_line(212, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)8;
    xsi_driver_first_trans_fast(t2);

LAB49:    goto LAB43;

LAB45:    t2 = (t0 + 2632U);
    t5 = *((char **)t2);
    t7 = *((unsigned char *)t5);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB47;

LAB48:    xsi_set_current_line(209, ng0);
    t2 = (t0 + 5352U);
    t12 = *((char **)t2);
    t32 = *((int *)t12);
    t39 = (t32 - 1);
    t2 = (t0 + 9096);
    t15 = (t2 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((int *)t18) = t39;
    xsi_driver_first_trans_fast(t2);
    goto LAB49;

LAB51:    xsi_set_current_line(218, ng0);
    t2 = (t0 + 2152U);
    t5 = *((char **)t2);
    t2 = (t0 + 5352U);
    t9 = *((char **)t2);
    t24 = *((int *)t9);
    t32 = (t24 + 1);
    t39 = (8 * t32);
    t40 = (t39 - 1);
    t2 = (t0 + 5352U);
    t12 = *((char **)t2);
    t41 = *((int *)t12);
    t42 = (t41 + 1);
    t43 = (8 * t42);
    t44 = (t43 - 8);
    t45 = (t44 - t40);
    t19 = (t45 * -1);
    t19 = (t19 + 1);
    t20 = (1U * t19);
    t6 = (t20 != 8U);
    if (t6 == 1)
        goto LAB54;

LAB55:    t2 = (t0 + 5352U);
    t15 = *((char **)t2);
    t46 = *((int *)t15);
    t47 = (t46 + 1);
    t48 = (8 * t47);
    t49 = (t48 - 1);
    t21 = (31 - t49);
    t25 = (1U * t21);
    t26 = (0U + t25);
    t2 = (t0 + 8840);
    t16 = (t2 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t30 = *((char **)t18);
    t31 = (t0 + 5352U);
    t35 = *((char **)t31);
    t50 = *((int *)t35);
    t51 = (t50 + 1);
    t52 = (8 * t51);
    t53 = (t52 - 1);
    t31 = (t0 + 5352U);
    t36 = *((char **)t31);
    t54 = *((int *)t36);
    t55 = (t54 + 1);
    t56 = (8 * t55);
    t57 = (t56 - 8);
    t58 = (t57 - t53);
    t27 = (t58 * -1);
    t27 = (t27 + 1);
    t33 = (1U * t27);
    memcpy(t30, t5, t33);
    t31 = (t0 + 5352U);
    t37 = *((char **)t31);
    t59 = *((int *)t37);
    t60 = (t59 + 1);
    t61 = (8 * t60);
    t62 = (t61 - 1);
    t31 = (t0 + 5352U);
    t38 = *((char **)t31);
    t63 = *((int *)t38);
    t64 = (t63 + 1);
    t65 = (8 * t64);
    t66 = (t65 - 8);
    t67 = (t66 - t62);
    t34 = (t67 * -1);
    t34 = (t34 + 1);
    t68 = (1U * t34);
    xsi_driver_first_trans_delta(t2, t26, t68, 0LL);
    goto LAB52;

LAB54:    xsi_size_not_matching(t20, 8U, 0);
    goto LAB55;

LAB56:    xsi_size_not_matching(8U, t26, 0);
    goto LAB57;

LAB58:    xsi_set_current_line(226, ng0);
    t2 = (t0 + 15562);
    t12 = (t0 + 8584);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 4U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(227, ng0);
    t2 = (t0 + 15566);
    t5 = (t0 + 8520);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(228, ng0);
    t2 = (t0 + 15598);
    t5 = (t0 + 3432U);
    t9 = *((char **)t5);
    t12 = ((IEEE_P_2592010699) + 4024);
    t15 = (t23 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 0;
    t16 = (t15 + 4U);
    *((int *)t16) = 4;
    t16 = (t15 + 8U);
    *((int *)t16) = 1;
    t24 = (4 - 0);
    t19 = (t24 * 1);
    t19 = (t19 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t19;
    t16 = (t0 + 14924U);
    t5 = xsi_base_array_concat(t5, t22, t12, (char)97, t2, t23, (char)97, t9, t16, (char)101);
    t17 = (t0 + 4552U);
    t18 = *((char **)t17);
    t19 = (31 - 23);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t17 = (t18 + t21);
    t31 = ((IEEE_P_2592010699) + 4024);
    t35 = (t29 + 0U);
    t36 = (t35 + 0U);
    *((int *)t36) = 23;
    t36 = (t35 + 4U);
    *((int *)t36) = 16;
    t36 = (t35 + 8U);
    *((int *)t36) = -1;
    t32 = (16 - 23);
    t25 = (t32 * -1);
    t25 = (t25 + 1);
    t36 = (t35 + 12U);
    *((unsigned int *)t36) = t25;
    t30 = xsi_base_array_concat(t30, t28, t31, (char)97, t5, t22, (char)97, t17, t29, (char)101);
    t36 = (t0 + 15603);
    t70 = ((IEEE_P_2592010699) + 4024);
    t72 = (t71 + 0U);
    t73 = (t72 + 0U);
    *((int *)t73) = 0;
    t73 = (t72 + 4U);
    *((int *)t73) = 0;
    t73 = (t72 + 8U);
    *((int *)t73) = 1;
    t39 = (0 - 0);
    t25 = (t39 * 1);
    t25 = (t25 + 1);
    t73 = (t72 + 12U);
    *((unsigned int *)t73) = t25;
    t38 = xsi_base_array_concat(t38, t69, t70, (char)97, t30, t28, (char)97, t36, t71, (char)101);
    t73 = (t0 + 4552U);
    t74 = *((char **)t73);
    t25 = (31 - 14);
    t26 = (t25 * 1U);
    t27 = (0 + t26);
    t73 = (t74 + t27);
    t77 = ((IEEE_P_2592010699) + 4024);
    t79 = (t78 + 0U);
    t80 = (t79 + 0U);
    *((int *)t80) = 14;
    t80 = (t79 + 4U);
    *((int *)t80) = 8;
    t80 = (t79 + 8U);
    *((int *)t80) = -1;
    t40 = (8 - 14);
    t33 = (t40 * -1);
    t33 = (t33 + 1);
    t80 = (t79 + 12U);
    *((unsigned int *)t80) = t33;
    t75 = xsi_base_array_concat(t75, t76, t77, (char)97, t38, t69, (char)97, t73, t78, (char)101);
    t80 = (t0 + 4552U);
    t81 = *((char **)t80);
    t33 = (31 - 7);
    t34 = (t33 * 1U);
    t68 = (0 + t34);
    t80 = (t81 + t68);
    t84 = ((IEEE_P_2592010699) + 4024);
    t86 = (t85 + 0U);
    t87 = (t86 + 0U);
    *((int *)t87) = 7;
    t87 = (t86 + 4U);
    *((int *)t87) = 4;
    t87 = (t86 + 8U);
    *((int *)t87) = -1;
    t41 = (4 - 7);
    t88 = (t41 * -1);
    t88 = (t88 + 1);
    t87 = (t86 + 12U);
    *((unsigned int *)t87) = t88;
    t82 = xsi_base_array_concat(t82, t83, t84, (char)97, t75, t76, (char)97, t80, t85, (char)101);
    t87 = (t0 + 15604);
    t92 = ((IEEE_P_2592010699) + 4024);
    t94 = (t93 + 0U);
    t95 = (t94 + 0U);
    *((int *)t95) = 0;
    t95 = (t94 + 4U);
    *((int *)t95) = 0;
    t95 = (t94 + 8U);
    *((int *)t95) = 1;
    t42 = (0 - 0);
    t88 = (t42 * 1);
    t88 = (t88 + 1);
    t95 = (t94 + 12U);
    *((unsigned int *)t95) = t88;
    t90 = xsi_base_array_concat(t90, t91, t92, (char)97, t82, t83, (char)97, t87, t93, (char)101);
    t95 = (t0 + 5512U);
    t96 = *((char **)t95);
    t1 = *((unsigned char *)t96);
    t98 = ((IEEE_P_2592010699) + 4024);
    t95 = xsi_base_array_concat(t95, t97, t98, (char)97, t90, t91, (char)99, t1, (char)101);
    t99 = (t0 + 4552U);
    t100 = *((char **)t99);
    t88 = (31 - 1);
    t101 = (t88 * 1U);
    t102 = (0 + t101);
    t99 = (t100 + t102);
    t105 = ((IEEE_P_2592010699) + 4024);
    t107 = (t106 + 0U);
    t108 = (t107 + 0U);
    *((int *)t108) = 1;
    t108 = (t107 + 4U);
    *((int *)t108) = 0;
    t108 = (t107 + 8U);
    *((int *)t108) = -1;
    t43 = (0 - 1);
    t109 = (t43 * -1);
    t109 = (t109 + 1);
    t108 = (t107 + 12U);
    *((unsigned int *)t108) = t109;
    t103 = xsi_base_array_concat(t103, t104, t105, (char)97, t95, t97, (char)97, t99, t106, (char)101);
    t109 = (5U + 3U);
    t110 = (t109 + 8U);
    t111 = (t110 + 1U);
    t112 = (t111 + 7U);
    t113 = (t112 + 4U);
    t114 = (t113 + 1U);
    t115 = (t114 + 1U);
    t116 = (t115 + 2U);
    t3 = (32U != t116);
    if (t3 == 1)
        goto LAB64;

LAB65:    t108 = (t0 + 8968);
    t117 = (t108 + 56U);
    t118 = *((char **)t117);
    t119 = (t118 + 56U);
    t120 = *((char **)t119);
    memcpy(t120, t103, 32U);
    xsi_driver_first_trans_fast_port(t108);
    xsi_set_current_line(230, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)9;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(231, ng0);
    t2 = (t0 + 8648);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(232, ng0);
    t2 = (t0 + 8776);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(233, ng0);
    t2 = (t0 + 8712);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB59;

LAB61:    t2 = (t0 + 2632U);
    t5 = *((char **)t2);
    t7 = *((unsigned char *)t5);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB63;

LAB64:    xsi_size_not_matching(32U, t116, 0);
    goto LAB65;

LAB66:    xsi_set_current_line(237, ng0);
    t2 = (t0 + 2152U);
    t5 = *((char **)t2);
    t2 = (t0 + 5352U);
    t9 = *((char **)t2);
    t24 = *((int *)t9);
    t32 = (8 * t24);
    t39 = (t32 - 1);
    t2 = (t0 + 5352U);
    t12 = *((char **)t2);
    t40 = *((int *)t12);
    t41 = (8 * t40);
    t42 = (t41 - 8);
    t43 = (t42 - t39);
    t19 = (t43 * -1);
    t19 = (t19 + 1);
    t20 = (1U * t19);
    t6 = (t20 != 8U);
    if (t6 == 1)
        goto LAB69;

LAB70:    t2 = (t0 + 5352U);
    t15 = *((char **)t2);
    t44 = *((int *)t15);
    t45 = (8 * t44);
    t46 = (t45 - 1);
    t21 = (31 - t46);
    t25 = (1U * t21);
    t26 = (0U + t25);
    t2 = (t0 + 8840);
    t16 = (t2 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t30 = *((char **)t18);
    t31 = (t0 + 5352U);
    t35 = *((char **)t31);
    t47 = *((int *)t35);
    t48 = (8 * t47);
    t49 = (t48 - 1);
    t31 = (t0 + 5352U);
    t36 = *((char **)t31);
    t50 = *((int *)t36);
    t51 = (8 * t50);
    t52 = (t51 - 8);
    t53 = (t52 - t49);
    t27 = (t53 * -1);
    t27 = (t27 + 1);
    t33 = (1U * t27);
    memcpy(t30, t5, t33);
    t31 = (t0 + 5352U);
    t37 = *((char **)t31);
    t54 = *((int *)t37);
    t55 = (8 * t54);
    t56 = (t55 - 1);
    t31 = (t0 + 5352U);
    t38 = *((char **)t31);
    t57 = *((int *)t38);
    t58 = (8 * t57);
    t59 = (t58 - 8);
    t60 = (t59 - t56);
    t34 = (t60 * -1);
    t34 = (t34 + 1);
    t68 = (1U * t34);
    xsi_driver_first_trans_delta(t2, t26, t68, 0LL);
    goto LAB67;

LAB69:    xsi_size_not_matching(t20, 8U, 0);
    goto LAB70;

}

static void work_a_2695113304_3212880686_p_1(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;

LAB0:    xsi_set_current_line(260, ng0);
    t3 = (t0 + 992U);
    t4 = xsi_signal_has_event(t3);
    if (t4 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t3 = (t0 + 8376);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(261, ng0);
    t5 = (t0 + 5832U);
    t12 = *((char **)t5);
    t13 = *((int *)t12);
    t14 = (t13 < 167);
    if (t14 != 0)
        goto LAB11;

LAB13:    t3 = (t0 + 5832U);
    t5 = *((char **)t3);
    t13 = *((int *)t5);
    t1 = (t13 > 166);
    if (t1 != 0)
        goto LAB14;

LAB15:
LAB12:    goto LAB3;

LAB5:    t5 = (t0 + 5672U);
    t9 = *((char **)t5);
    t10 = *((unsigned char *)t9);
    t11 = (t10 == (unsigned char)3);
    t1 = t11;
    goto LAB7;

LAB8:    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    t2 = t8;
    goto LAB10;

LAB11:    xsi_set_current_line(262, ng0);
    t5 = (t0 + 9608);
    t15 = (t5 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(263, ng0);
    t3 = (t0 + 5832U);
    t5 = *((char **)t3);
    t13 = *((int *)t5);
    t19 = (t13 + 1);
    t3 = (t0 + 9672);
    t6 = (t3 + 56U);
    t9 = *((char **)t6);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((int *)t15) = t19;
    xsi_driver_first_trans_fast(t3);
    goto LAB12;

LAB14:    xsi_set_current_line(265, ng0);
    t3 = (t0 + 9608);
    t6 = (t3 + 56U);
    t9 = *((char **)t6);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(266, ng0);
    t3 = (t0 + 9672);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t9 = (t6 + 56U);
    t12 = *((char **)t9);
    *((int *)t12) = 0;
    xsi_driver_first_trans_fast(t3);
    goto LAB12;

}


extern void work_a_2695113304_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2695113304_3212880686_p_0,(void *)work_a_2695113304_3212880686_p_1};
	xsi_register_didat("work_a_2695113304_3212880686", "isim/Tbi2c_isim_beh.exe.sim/work/a_2695113304_3212880686.didat");
	xsi_register_executes(pe);
}
