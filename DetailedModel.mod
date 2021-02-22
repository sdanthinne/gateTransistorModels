*
*	EE307 MODELS
*

*	Created by Greg Flewelling  2/1/07 (http://web.eece.maine.edu/~hummels/classes/ece343/docs/umaine.lib)


.MODEL BS250P PMOS VTO=-3.193 RS=2.041 RD=0.697 IS=1E-15 KP=0.277
+CBD=105E-12 PB=1 LAMBDA=1.2E-2

.MODEL 2N7000   NMOS (LEVEL=3   RS=0.205           NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=3.1716E-9
+RD=0.239       VTO=1.000       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=0.8E-2)



*	The MOSFET spice model includes the parameter PHI, which is the "surface
*	potential" for the device.  It is equivalent to the 2*phi_F that we
*	used in class when discussing the body effect.  The Mosfet threshold
*	is determined for spice level-1 models by
*
*	V_thresh = VTO + GAMMA*( sqrt(PHI+V_sb) - sqrt(PHI) )
*
.model CD4007 NMOS
+ Level=1    Gamma= 2.7   Xj=0
+ Tox=1200n  Phi=.6     Rs=0      Kp=111u  Vto=2.0    Lambda=0.01
+ Rd=0       Cbd=2.0p   Cbs=2.0p  Pb=.8    Cgso=0.1p
+ Cgdo=0.1p  Is=16.64p  N=1	  L=10E-6  W=30E-6
*   L & W added 2/22/07  -DMH

.model CD4007 PMOS
+ Level=1    Gamma= 2.7   Xj=0
+ Tox=1200n  Phi=.6     Rs=0      Kp=55u  Vto=-1.5   Lambda=0.04
+ Rd=0       Cbd=4.0p   Cbs=4.0p  Pb=.8   Cgso=0.2p
+ Cgdo=0.2p  Is=16.64p  N=1       L=10E-6 W=60E-6
*  L & W added 2/22/07  -DMH

*	ALD1106 and ALD1107 model parameters are based upon data provided
* 	on their respective spec sheets.  KP(W/L) is estimated... the actual
* 	value of L, W, KP are not known.
*           ---  Updated 2/21/2011 to reflect student measurements on labs 1 & 2
* 		(LAMBDA changed from .004 to .04 for ALD1107)
* 	    ---  Updated 2/21/2012 to reflect student measurements on HW 1
*
.MODEL ALD1106 NMOS (LEVEL=1 CBD=0.5p CBS=0.5p CGDO=0.1p CGSO=0.1p GAMMA=.85
+ KP=225u L=10E-6 LAMBDA=0.029 PHI=.9 VTO=0.7 W=20E-6)

.MODEL ALD1107 PMOS (LEVEL=1 CBD=0.5p CBS=0.5p CGDO=0.1p CGSO=0.1p GAMMA=.45
+ KP=100u L=10E-6 LAMBDA=0.0304 PHI=.8 VTO=-0.82 W=20E-6)

*
* Modified values labeled cd4007ube based on measurements Feb 8 2009 -DMH
*
.MODEL CD4007UBE PMOS (LEVEL=1 CBD=4.0p CBS=4.0p CGDO=0.2p CGSO=0.2p GAMMA=.42
+ IS=16.64p KP=55u L=10E-6 LAMBDA=0.04 PB=.8 PHI=.6 TOX=1200n VTO=-1.0 W=60E-6)

.MODEL CD4007UBE NMOS (LEVEL=1 CBD=2.0p CBS=2.0p CGDO=0.1p CGSO=0.1p GAMMA=1.8
+ IS=16.64p KP=150u L=10E-6 LAMBDA=0.01 PB=.8 PHI=.3 TOX=1200n VTO=0.95 W=33E-6)


* Previous ECE342/3 model from unknown source replaced Fall '08
* with the 2N2907 model distributed with Microcap (below).  -DMH
*
* .model 2n2907 pnp (is=1.1P bf=200 nf=1.2 vaf=50 ikf=0.1 ise=13p ne=1.9 br=6
* + rc=0.6 cje=23p vje=0.85 mje=1.25 tf=0.5n cjc=19p vjc=0.5 mjc=0.2 tr=34n
* + xtb=1.5)

.MODEL 2N2907 PNP (BF=217.797 BR=2.98475 CJC=36.6437p CJE=67.0252p IKF=1.12749
+ IKR=1.00038 IS=10.0118f ISC=9.55131p ISE=1.01042p ITF=10m MJC=558.066m
+ MJE=595.493m NE=1.65086 NF=954.211m RC=405.548m RE=1.56766 TF=1n TR=29.1239n
+ VAF=100 VJC=700m VJE=700m VTF=10 XTF=500m)

* 2n3906 model created using Parts version 6.0 on 11/19/01 at 16:43
* Parts is a MicroSim product.
*
.model Q2n3906  PNP(Is=455.9E-18 Xti=3 Eg=1.11 Vaf=33.6 Bf=204.7 Ise=7.558f
+               Ne=1.536 Ikf=.3287 Nk=.9957 Xtb=1.5 Var=100 Br=3.72
+               Isc=529.3E-18 Nc=15.51 Ikr=11.1 Rc=.8508 Cjc=10.13p Mjc=.6993
+               Vjc=1.006 Fc=.5 Cje=10.39p Mje=.6931 Vje=.9937 Tr=10n Tf=181.2p
+               Itf=4.881m Xtf=.7939 Vtf=10 Rb=10)
*
*               Fairchild  pid=66   case=TO92
*               11/19/2001 calccb update


*
* NMOS in SCN05 process technology using 0.5 micron feature size
*
.MODEL CMOSN_0.5 NMOS (                                LEVEL   = 8
+VERSION = 3.1            TNOM    = 27             TOX     = 1.4E-8
+XJ      = 1.5E-7         NCH     = 1.7E17         VTH0    = 0.6656437
+K1      = 0.875093       K2      = -0.0943223     K3      = 25.0562441
+K3B     = -8.5140476     W0      = 1.01582E-8     NLX     = 1E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 2.670658       DVT1    = 0.4282172      DVT2    = -0.1373089
+U0      = 452.3081836    UA      = 3.061716E-13   UB      = 1.515137E-18
+UC      = 1.166279E-11   VSAT    = 1.682414E5     A0      = 0.6297744
+AGS     = 0.1384489      B0      = 2.579158E-6    B1      = 5E-6
+KETA    = -3.615287E-3   A1      = 1.054571E-6    A2      = 0.3379035
+RDSW    = 1.380341E3     PRWG    = 0.0301426      PRWB    = 0.0106493
+WR      = 1              WINT    = 2.594349E-7    LINT    = 7.489566E-8
+XL      = 1E-7           XW      = 0              DWG     = -9.471353E-9
+DWB     = 3.537786E-8    VOFF    = 0              NFACTOR = 1.0754804
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 2.332015E-3    ETAB    = -1.531255E-4
+DSUB    = 0.076309       PCLM    = 2.6209353      PDIBLC1 = 1
+PDIBLC2 = 2.23243E-3     PDIBLCB = -0.0436947     DROUT   = 1.0300278
+PSCBE1  = 6.619472E8     PSCBE2  = 2.968801E-4    PVAG    = 9.970995E-3
+DELTA   = 0.01           RSH     = 80.9           MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 2.34E-10       CGSO    = 2.34E-10       CGBO    = 1E-9
+CJ      = 4.240724E-4    PB      = 0.9148626      MJ      = 0.4416777
+CJSW    = 3.007134E-10   PBSW    = 0.8            MJSW    = 0.2025106
+CJSWG   = 1.64E-10       PBSWG   = 0.8            MJSWG   = 0.2025106
+CF      = 0              PVTH0   = 0.0526696      PRDSW   = 110.1539295
+PK2     = -0.0283027     WKETA   = -0.0191754     LKETA   = 8.469064E-4     )



*
* PMOS in SCN05 process technology using 0.5 micron feature size
*
.MODEL CMOSP_0.5 PMOS (                                LEVEL   = 8
+VERSION = 3.1            TNOM    = 27             TOX     = 1.4E-8
+XJ      = 1.5E-7         NCH     = 1.7E17         VTH0    = -0.9633249
+K1      = 0.5600277      K2      = 9.302429E-3    K3      = 7.2192028
+K3B     = -1.0103515     W0      = 1.010628E-8    NLX     = 5.826683E-8
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 2.2199372      DVT1    = 0.5378964      DVT2    = -0.1158128
+U0      = 220.5729225    UA      = 3.141811E-9    UB      = 1.085892E-21
+UC      = -5.76898E-11   VSAT    = 1.342779E5     A0      = 0.9333822
+AGS     = 0.157364       B0      = 9.735259E-7    B1      = 5E-6
+KETA    = -2.42686E-3    A1      = 3.447019E-4    A2      = 0.3701317
+RDSW    = 3E3            PRWG    = -0.0418484     PRWB    = -0.0212357
+WR      = 1              WINT    = 3.097872E-7    LINT    = 1.040878E-7
+XL      = 1E-7           XW      = 0              DWG     = -1.983686E-8
+DWB     = 1.629532E-8    VOFF    = -0.0823738     NFACTOR = 0.969384
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.4985496      ETAB    = -0.0653358
+DSUB    = 1              PCLM    = 2.1142057      PDIBLC1 = 0.0256688
+PDIBLC2 = 3.172604E-3    PDIBLCB = -0.0511673     DROUT   = 0.1695622
+PSCBE1  = 1.851867E10    PSCBE2  = 1.697939E-9    PVAG    = 0
+DELTA   = 0.01           RSH     = 103.6          MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 3.09E-10       CGSO    = 3.09E-10       CGBO    = 1E-9
+CJ      = 7.410008E-4    PB      = 0.9665307      MJ      = 0.4978642
+CJSW    = 2.487127E-10   PBSW    = 0.99           MJSW    = 0.3877813
+CJSWG   = 6.4E-11        PBSWG   = 0.99           MJSWG   = 0.3877813
+CF      = 0              PVTH0   = 5.98016E-3     PRDSW   = 14.8598424
+PK2     = 3.73981E-3     WKETA   = 2.870507E-3    LKETA   = -4.823171E-3    )

;$SpiceType=AMBIGUOUS
