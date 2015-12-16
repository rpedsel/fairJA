set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.1598, <2> 36.7104, <3> 24.0316, <4> 6.4707, <5> 5.2797, <6> 16.4296, <7> 26.7245, <8> 1.2849, <9> 14.2631, <10> 13.4687;
param workload[JOB] := <1> 46.1431, <2> 40.5965, <3> 32.7925, <4> 22.0218, <5> 4.5592, <6> 5.3003, <7> 38.2479, <8> 22.4016, <9> 24.2803, <10> 44.6314;
param capacity[MACHINE] := <1> 93.6582, <2> 93.6582, <3> 93.6582;

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
