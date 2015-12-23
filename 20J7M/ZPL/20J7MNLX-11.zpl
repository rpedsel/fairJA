set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6661, <2> 28.9792, <3> 28.8561, <4> 30.6309, <5> 28.0859, <6> 22.2607, <7> 32.0841, <8> 28.7875, <9> 27.0386, <10> 30.128, <11> 22.2969, <12> 27.4466, <13> 29.334, <14> 25.6972, <15> 22.7357, <16> 26.3579, <17> 28.8898, <18> 30.1765, <19> 23.1821, <20> 21.329;
param workload[JOB] := <1> 5.5377, <2> 5.3832, <3> 5.3718, <4> 5.5345, <5> 5.2996, <6> 4.7181, <7> 5.6643, <8> 5.3654, <9> 5.1999, <10> 5.4889, <11> 4.722, <12> 5.239, <13> 5.4161, <14> 5.0692, <15> 4.7682, <16> 5.134, <17> 5.3749, <18> 5.4933, <19> 4.8148, <20> 4.6183;
param capacity[MACHINE] := <1> 14.8876, <2> 14.8876, <3> 14.8876, <4> 14.8876, <5> 14.8876, <6> 14.8876, <7> 14.8876;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
