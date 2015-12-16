set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.5602, <2> 29.7305, <3> 16.7745, <4> 21.3507, <5> 23.0948, <6> 16.9685, <7> 32.2913, <8> 24.2343, <9> 26.977, <10> 31.9608, <11> 30.6524, <12> 14.0845, <13> 10.9435, <14> 18.4725, <15> 21.1216, <16> 26.7152, <17> 20.9991, <18> 25.6504, <19> 22.1509, <20> 24.2831;
param workload[JOB] := <1> 5.2498, <2> 5.4526, <3> 4.0957, <4> 4.6207, <5> 4.8057, <6> 4.1193, <7> 5.6825, <8> 4.9228, <9> 5.1939, <10> 5.6534, <11> 5.5365, <12> 3.7529, <13> 3.3081, <14> 4.298, <15> 4.5958, <16> 5.1687, <17> 4.5825, <18> 5.0646, <19> 4.7065, <20> 4.9278;
param capacity[MACHINE] := <1> 11.9672, <2> 11.9672, <3> 11.9672, <4> 11.9672, <5> 11.9672, <6> 11.9672;

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
