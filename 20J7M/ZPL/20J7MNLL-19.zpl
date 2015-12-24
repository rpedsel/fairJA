set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.7751, <2> 26.2524, <3> 15.2296, <4> 19.2841, <5> 21.674, <6> 26.8038, <7> 31.0861, <8> 24.7347, <9> 19.8963, <10> 24.3141, <11> 23.8761, <12> 29.043, <13> 11.9116, <14> 18.6431, <15> 33.3395, <16> 33.7452, <17> 21.317, <18> 15.5778, <19> 23.7782, <20> 28.7651;
param workload[JOB] := <1> 29.7751, <2> 26.2524, <3> 15.2296, <4> 19.2841, <5> 21.674, <6> 26.8038, <7> 31.0861, <8> 24.7347, <9> 19.8963, <10> 24.3141, <11> 23.8761, <12> 29.043, <13> 11.9116, <14> 18.6431, <15> 33.3395, <16> 33.7452, <17> 21.317, <18> 15.5778, <19> 23.7782, <20> 28.7651;
param capacity[MACHINE] := <1> 68.4353, <2> 68.4353, <3> 68.4353, <4> 68.4353, <5> 68.4353, <6> 68.4353, <7> 68.4353;

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
