set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.5077, <2> 39.1502, <3> 26.1539, <4> 46.6762, <5> 17.0183, <6> 48.276, <7> 9.1853, <8> 37.9842, <9> 40.9644, <10> 27.2805, <11> 31.5309, <12> 41.4952, <13> 42.9165, <14> 13.4157, <15> 18.7402, <16> 26.3278, <17> 25.1189, <18> 31.3707, <19> 1.6373, <20> 36.2184;
param workload[JOB] := <1> 2.1231, <2> 6.257, <3> 5.1141, <4> 6.832, <5> 4.1253, <6> 6.9481, <7> 3.0307, <8> 6.1631, <9> 6.4003, <10> 5.2231, <11> 5.6152, <12> 6.4417, <13> 6.5511, <14> 3.6627, <15> 4.329, <16> 5.1311, <17> 5.0119, <18> 5.601, <19> 1.2796, <20> 6.0182;
param capacity[MACHINE] := <1> 101.8583, <2> 101.8583, <3> 101.8583, <4> 101.8583, <5> 101.8583, <6> 101.8583, <7> 101.8583;

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
