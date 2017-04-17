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
    char t66[16];
    char t68[16];
    char t73[16];
    char t75[16];
    char t80[16];
    char t82[16];
    char t88[16];
    char t90[16];
    char t94[16];
    char t101[16];
    char t103[16];
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
    char *t67;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t74;
    char *t76;
    char *t77;
    char *t78;
    char *t79;
    char *t81;
    char *t83;
    char *t84;
    unsigned int t85;
    char *t87;
    char *t89;
    char *t91;
    char *t92;
    char *t93;
    char *t95;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    char *t102;
    char *t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    char *t115;
    char *t116;
    char *t117;
    static char *nl0[] = {&&LAB15, &&LAB17, &&LAB16, &&LAB18, &&LAB19, &&LAB20, &&LAB24, &&LAB21, &&LAB22, &&LAB23};

LAB0:    xsi_set_current_line(132, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 7720);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(133, ng0);
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
LAB9:    xsi_set_current_line(137, ng0);
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

LAB8:    xsi_set_current_line(134, ng0);
    t4 = (t0 + 7816);
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

LAB14:    xsi_set_current_line(241, ng0);
    t2 = (t0 + 2632U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 8712);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(242, ng0);
    t2 = (t0 + 3592U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 8776);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(243, ng0);
    t2 = (t0 + 3432U);
    t4 = *((char **)t2);
    t2 = (t0 + 8840);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 3U);
    xsi_driver_first_trans_delta(t2, 5U, 3U, 0LL);
    xsi_set_current_line(244, ng0);
    t2 = (t0 + 14359);
    t1 = (5U != 5U);
    if (t1 == 1)
        goto LAB71;

LAB72:    t5 = (t0 + 8840);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 5U);
    xsi_driver_first_trans_delta(t5, 0U, 5U, 0LL);
    goto LAB3;

LAB15:    xsi_set_current_line(139, ng0);
    t5 = (t0 + 14104);
    t12 = (t0 + 7880);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 14136);
    t5 = (t0 + 7944);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 8008);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 14140);
    t5 = (t0 + 8072);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    goto LAB14;

LAB16:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 14172);
    t5 = (t0 + 7880);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 14204);
    t5 = (t0 + 7944);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 7816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB17:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 8136);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 14208);
    t5 = (t0 + 7880);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 14240);
    t5 = (t0 + 7944);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(156, ng0);
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

LAB26:    t31 = (t0 + 8200);
    t35 = (t31 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t17, 32U);
    xsi_driver_first_trans_fast_port(t31);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 7816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB18:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 8136);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 14244);
    t5 = (t0 + 7944);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(162, ng0);
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
LAB28:    xsi_set_current_line(165, ng0);
    t2 = (t0 + 7816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)4;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB19:    xsi_set_current_line(169, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 8264);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 7816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)5;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(171, ng0);
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

LAB32:    xsi_set_current_line(175, ng0);
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
LAB34:    xsi_set_current_line(178, ng0);
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
    t9 = (t0 + 8328);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((int *)t17) = t32;
    xsi_driver_first_trans_fast(t9);

LAB31:    goto LAB14;

LAB20:    xsi_set_current_line(182, ng0);
    t2 = (t0 + 8392);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(183, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(184, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t19 = (31 - 14);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t0 + 8520);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 7U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(186, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t19 = (31 - 23);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t0 + 8584);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(187, ng0);
    t2 = (t0 + 8648);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(188, ng0);
    t2 = (t0 + 8008);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(189, ng0);
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

LAB21:    xsi_set_current_line(199, ng0);
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
LAB43:    xsi_set_current_line(209, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB51;

LAB53:
LAB52:    xsi_set_current_line(215, ng0);
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

LAB57:    t12 = (t0 + 8584);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    t30 = (t18 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t2, 8U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB14;

LAB22:    xsi_set_current_line(218, ng0);
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
LAB59:    xsi_set_current_line(226, ng0);
    t2 = (t0 + 2792U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB66;

LAB68:
LAB67:    goto LAB14;

LAB23:    xsi_set_current_line(233, ng0);
    t2 = (t0 + 14323);
    t5 = (t0 + 7944);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(234, ng0);
    t2 = (t0 + 14327);
    t5 = (t0 + 7880);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(235, ng0);
    t2 = (t0 + 4872U);
    t4 = *((char **)t2);
    t2 = (t0 + 8200);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(236, ng0);
    t2 = (t0 + 7816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB24:    xsi_set_current_line(239, ng0);
    goto LAB14;

LAB25:    xsi_size_not_matching(32U, t34, 0);
    goto LAB26;

LAB27:    xsi_set_current_line(163, ng0);
    t5 = (t0 + 14248);
    t12 = (t0 + 7880);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB28;

LAB30:    xsi_set_current_line(172, ng0);
    t9 = (t0 + 8328);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((int *)t17) = 4;
    xsi_driver_first_trans_fast(t9);
    goto LAB31;

LAB33:    xsi_set_current_line(176, ng0);
    t9 = (t0 + 8328);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((int *)t17) = 1;
    xsi_driver_first_trans_fast(t9);
    goto LAB34;

LAB36:    xsi_set_current_line(190, ng0);
    t2 = (t0 + 7816);
    t9 = (t2 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)7;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(191, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t24 = (1 - 31);
    t19 = (t24 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 8392);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(192, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t24 = (1 - 31);
    t19 = (t24 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t1 = *((unsigned char *)t2);
    t3 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t1);
    t5 = (t0 + 8456);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t3;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(193, ng0);
    t2 = (t0 + 4712U);
    t4 = *((char **)t2);
    t19 = (31 - 31);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t2 = (t4 + t21);
    t5 = (t0 + 8584);
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

LAB42:    xsi_set_current_line(200, ng0);
    t2 = (t0 + 5352U);
    t9 = *((char **)t2);
    t24 = *((int *)t9);
    t10 = (t24 > 1);
    if (t10 != 0)
        goto LAB48;

LAB50:    xsi_set_current_line(204, ng0);
    t2 = (t0 + 7816);
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

LAB48:    xsi_set_current_line(201, ng0);
    t2 = (t0 + 5352U);
    t12 = *((char **)t2);
    t32 = *((int *)t12);
    t39 = (t32 - 1);
    t2 = (t0 + 8328);
    t15 = (t2 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((int *)t18) = t39;
    xsi_driver_first_trans_fast(t2);
    goto LAB49;

LAB51:    xsi_set_current_line(210, ng0);
    t2 = (t0 + 2152U);
    t5 = *((char **)t2);
    t2 = (t0 + 5352U);
    t9 = *((char **)t2);
    t24 = *((int *)t9);
    t32 = (3 - t24);
    t39 = (8 * t32);
    t40 = (t39 + 7);
    t2 = (t0 + 5352U);
    t12 = *((char **)t2);
    t41 = *((int *)t12);
    t42 = (3 - t41);
    t43 = (8 * t42);
    t44 = (t43 - t40);
    t19 = (t44 * -1);
    t19 = (t19 + 1);
    t20 = (1U * t19);
    t6 = (t20 != 8U);
    if (t6 == 1)
        goto LAB54;

LAB55:    t2 = (t0 + 5352U);
    t15 = *((char **)t2);
    t45 = *((int *)t15);
    t46 = (3 - t45);
    t47 = (8 * t46);
    t48 = (t47 + 7);
    t21 = (31 - t48);
    t25 = (1U * t21);
    t26 = (0U + t25);
    t2 = (t0 + 8072);
    t16 = (t2 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t30 = *((char **)t18);
    t31 = (t0 + 5352U);
    t35 = *((char **)t31);
    t49 = *((int *)t35);
    t50 = (3 - t49);
    t51 = (8 * t50);
    t52 = (t51 + 7);
    t31 = (t0 + 5352U);
    t36 = *((char **)t31);
    t53 = *((int *)t36);
    t54 = (3 - t53);
    t55 = (8 * t54);
    t56 = (t55 - t52);
    t27 = (t56 * -1);
    t27 = (t27 + 1);
    t33 = (1U * t27);
    memcpy(t30, t5, t33);
    t31 = (t0 + 5352U);
    t37 = *((char **)t31);
    t57 = *((int *)t37);
    t58 = (3 - t57);
    t59 = (8 * t58);
    t60 = (t59 + 7);
    t31 = (t0 + 5352U);
    t38 = *((char **)t31);
    t61 = *((int *)t38);
    t62 = (3 - t61);
    t63 = (8 * t62);
    t64 = (t63 - t60);
    t34 = (t64 * -1);
    t34 = (t34 + 1);
    t65 = (1U * t34);
    xsi_driver_first_trans_delta(t2, t26, t65, 0LL);
    goto LAB52;

LAB54:    xsi_size_not_matching(t20, 8U, 0);
    goto LAB55;

LAB56:    xsi_size_not_matching(8U, t26, 0);
    goto LAB57;

LAB58:    xsi_set_current_line(219, ng0);
    t2 = (t0 + 14280);
    t12 = (t0 + 7944);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 4U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(220, ng0);
    t2 = (t0 + 14284);
    t5 = (t0 + 7880);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(221, ng0);
    t2 = (t0 + 14316);
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
    t16 = (t0 + 13740U);
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
    t36 = (t0 + 14321);
    t67 = ((IEEE_P_2592010699) + 4024);
    t69 = (t68 + 0U);
    t70 = (t69 + 0U);
    *((int *)t70) = 0;
    t70 = (t69 + 4U);
    *((int *)t70) = 0;
    t70 = (t69 + 8U);
    *((int *)t70) = 1;
    t39 = (0 - 0);
    t25 = (t39 * 1);
    t25 = (t25 + 1);
    t70 = (t69 + 12U);
    *((unsigned int *)t70) = t25;
    t38 = xsi_base_array_concat(t38, t66, t67, (char)97, t30, t28, (char)97, t36, t68, (char)101);
    t70 = (t0 + 4552U);
    t71 = *((char **)t70);
    t25 = (31 - 14);
    t26 = (t25 * 1U);
    t27 = (0 + t26);
    t70 = (t71 + t27);
    t74 = ((IEEE_P_2592010699) + 4024);
    t76 = (t75 + 0U);
    t77 = (t76 + 0U);
    *((int *)t77) = 14;
    t77 = (t76 + 4U);
    *((int *)t77) = 8;
    t77 = (t76 + 8U);
    *((int *)t77) = -1;
    t40 = (8 - 14);
    t33 = (t40 * -1);
    t33 = (t33 + 1);
    t77 = (t76 + 12U);
    *((unsigned int *)t77) = t33;
    t72 = xsi_base_array_concat(t72, t73, t74, (char)97, t38, t66, (char)97, t70, t75, (char)101);
    t77 = (t0 + 4552U);
    t78 = *((char **)t77);
    t33 = (31 - 7);
    t34 = (t33 * 1U);
    t65 = (0 + t34);
    t77 = (t78 + t65);
    t81 = ((IEEE_P_2592010699) + 4024);
    t83 = (t82 + 0U);
    t84 = (t83 + 0U);
    *((int *)t84) = 7;
    t84 = (t83 + 4U);
    *((int *)t84) = 4;
    t84 = (t83 + 8U);
    *((int *)t84) = -1;
    t41 = (4 - 7);
    t85 = (t41 * -1);
    t85 = (t85 + 1);
    t84 = (t83 + 12U);
    *((unsigned int *)t84) = t85;
    t79 = xsi_base_array_concat(t79, t80, t81, (char)97, t72, t73, (char)97, t77, t82, (char)101);
    t84 = (t0 + 14322);
    t89 = ((IEEE_P_2592010699) + 4024);
    t91 = (t90 + 0U);
    t92 = (t91 + 0U);
    *((int *)t92) = 0;
    t92 = (t91 + 4U);
    *((int *)t92) = 0;
    t92 = (t91 + 8U);
    *((int *)t92) = 1;
    t42 = (0 - 0);
    t85 = (t42 * 1);
    t85 = (t85 + 1);
    t92 = (t91 + 12U);
    *((unsigned int *)t92) = t85;
    t87 = xsi_base_array_concat(t87, t88, t89, (char)97, t79, t80, (char)97, t84, t90, (char)101);
    t92 = (t0 + 5512U);
    t93 = *((char **)t92);
    t1 = *((unsigned char *)t93);
    t95 = ((IEEE_P_2592010699) + 4024);
    t92 = xsi_base_array_concat(t92, t94, t95, (char)97, t87, t88, (char)99, t1, (char)101);
    t96 = (t0 + 4552U);
    t97 = *((char **)t96);
    t85 = (31 - 1);
    t98 = (t85 * 1U);
    t99 = (0 + t98);
    t96 = (t97 + t99);
    t102 = ((IEEE_P_2592010699) + 4024);
    t104 = (t103 + 0U);
    t105 = (t104 + 0U);
    *((int *)t105) = 1;
    t105 = (t104 + 4U);
    *((int *)t105) = 0;
    t105 = (t104 + 8U);
    *((int *)t105) = -1;
    t43 = (0 - 1);
    t106 = (t43 * -1);
    t106 = (t106 + 1);
    t105 = (t104 + 12U);
    *((unsigned int *)t105) = t106;
    t100 = xsi_base_array_concat(t100, t101, t102, (char)97, t92, t94, (char)97, t96, t103, (char)101);
    t106 = (5U + 3U);
    t107 = (t106 + 8U);
    t108 = (t107 + 1U);
    t109 = (t108 + 7U);
    t110 = (t109 + 4U);
    t111 = (t110 + 1U);
    t112 = (t111 + 1U);
    t113 = (t112 + 2U);
    t3 = (32U != t113);
    if (t3 == 1)
        goto LAB64;

LAB65:    t105 = (t0 + 8200);
    t114 = (t105 + 56U);
    t115 = *((char **)t114);
    t116 = (t115 + 56U);
    t117 = *((char **)t116);
    memcpy(t117, t100, 32U);
    xsi_driver_first_trans_fast_port(t105);
    xsi_set_current_line(223, ng0);
    t2 = (t0 + 7816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)9;
    xsi_driver_first_trans_fast(t2);
    goto LAB59;

LAB61:    t2 = (t0 + 2632U);
    t5 = *((char **)t2);
    t7 = *((unsigned char *)t5);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB63;

LAB64:    xsi_size_not_matching(32U, t113, 0);
    goto LAB65;

LAB66:    xsi_set_current_line(227, ng0);
    t2 = (t0 + 2152U);
    t5 = *((char **)t2);
    t2 = (t0 + 5352U);
    t9 = *((char **)t2);
    t24 = *((int *)t9);
    t32 = (4 - t24);
    t39 = (8 * t32);
    t40 = (t39 + 7);
    t2 = (t0 + 5352U);
    t12 = *((char **)t2);
    t41 = *((int *)t12);
    t42 = (4 - t41);
    t43 = (8 * t42);
    t44 = (t43 - t40);
    t19 = (t44 * -1);
    t19 = (t19 + 1);
    t20 = (1U * t19);
    t6 = (t20 != 8U);
    if (t6 == 1)
        goto LAB69;

LAB70:    t2 = (t0 + 5352U);
    t15 = *((char **)t2);
    t45 = *((int *)t15);
    t46 = (4 - t45);
    t47 = (8 * t46);
    t48 = (t47 + 7);
    t21 = (31 - t48);
    t25 = (1U * t21);
    t26 = (0U + t25);
    t2 = (t0 + 8072);
    t16 = (t2 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t30 = *((char **)t18);
    t31 = (t0 + 5352U);
    t35 = *((char **)t31);
    t49 = *((int *)t35);
    t50 = (4 - t49);
    t51 = (8 * t50);
    t52 = (t51 + 7);
    t31 = (t0 + 5352U);
    t36 = *((char **)t31);
    t53 = *((int *)t36);
    t54 = (4 - t53);
    t55 = (8 * t54);
    t56 = (t55 - t52);
    t27 = (t56 * -1);
    t27 = (t27 + 1);
    t33 = (1U * t27);
    memcpy(t30, t5, t33);
    t31 = (t0 + 5352U);
    t37 = *((char **)t31);
    t57 = *((int *)t37);
    t58 = (4 - t57);
    t59 = (8 * t58);
    t60 = (t59 + 7);
    t31 = (t0 + 5352U);
    t38 = *((char **)t31);
    t61 = *((int *)t38);
    t62 = (4 - t61);
    t63 = (8 * t62);
    t64 = (t63 - t60);
    t34 = (t64 * -1);
    t34 = (t34 + 1);
    t65 = (1U * t34);
    xsi_driver_first_trans_delta(t2, t26, t65, 0LL);
    goto LAB67;

LAB69:    xsi_size_not_matching(t20, 8U, 0);
    goto LAB70;

LAB71:    xsi_size_not_matching(5U, 5U, 0);
    goto LAB72;

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

LAB0:    xsi_set_current_line(252, ng0);
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
LAB3:    t3 = (t0 + 7736);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(253, ng0);
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

LAB11:    xsi_set_current_line(254, ng0);
    t5 = (t0 + 8904);
    t15 = (t5 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(255, ng0);
    t3 = (t0 + 5832U);
    t5 = *((char **)t3);
    t13 = *((int *)t5);
    t19 = (t13 + 1);
    t3 = (t0 + 8968);
    t6 = (t3 + 56U);
    t9 = *((char **)t6);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((int *)t15) = t19;
    xsi_driver_first_trans_fast(t3);
    goto LAB12;

LAB14:    xsi_set_current_line(257, ng0);
    t3 = (t0 + 8904);
    t6 = (t3 + 56U);
    t9 = *((char **)t6);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(258, ng0);
    t3 = (t0 + 8968);
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
