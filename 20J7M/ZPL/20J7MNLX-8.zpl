set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.2216, <2> 27.1527, <3> 26.4546, <4> 27.0871, <5> 31.9218, <6> 24.0943, <7> 18.4422, <8> 22.3981, <9> 14.6618, <10> 9.2796, <11> 27.2771, <12> 15.7646, <13> 28.0477, <14> 24.0366, <15> 23.1163, <16> 22.7047, <17> 21.5727, <18> 21.502, <19> 23.9375, <20> 21.185;
param workload[JOB] := <1> 5.5876, <2> 5.2108, <3> 5.1434, <4> 5.2045, <5> 5.6499, <6> 4.9086, <7> 4.2944, <8> 4.7327, <9> 3.8291, <10> 3.0462, <11> 5.2227, <12> 3.9705, <13> 5.296, <14> 4.9027, <15> 4.8079, <16> 4.7649, <17> 4.6446, <18> 4.637, <19> 4.8926, <20> 4.6027;
param capacity[MACHINE] := <1> 13.6213, <2> 13.6213, <3> 13.6213, <4> 13.6213, <5> 13.6213, <6> 13.6213, <7> 13.6213;

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
