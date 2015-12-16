set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.9031, <2> 40.6896, <3> 16.1994, <4> 11.3666, <5> 28.8992, <6> 4.4682, <7> 24.775, <8> 43.0884, <9> 43.4383, <10> 45.8761, <11> 22.2379, <12> 30.2428, <13> 7.4987, <14> 37.0674, <15> 25.3374, <16> 13.4222, <17> 1.4979, <18> 22.0248, <19> 32.4765, <20> 2.6534;
param workload[JOB] := <1> 6.3956, <2> 6.3788, <3> 4.0248, <4> 3.3714, <5> 5.3758, <6> 2.1138, <7> 4.9774, <8> 6.5642, <9> 6.5908, <10> 6.7732, <11> 4.7157, <12> 5.4993, <13> 2.7384, <14> 6.0883, <15> 5.0336, <16> 3.6636, <17> 1.2239, <18> 4.6931, <19> 5.6988, <20> 1.6289;
param capacity[MACHINE] := <1> 11.6937, <2> 11.6937, <3> 11.6937, <4> 11.6937, <5> 11.6937, <6> 11.6937;

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
