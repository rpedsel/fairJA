set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.7099, <2> 29.1443, <3> 33.6957, <4> 25.6544, <5> 23.8325, <6> 16.1796, <7> 12.6667, <8> 14.5216, <9> 14.1048, <10> 10.3994, <11> 48.706, <12> 5.3515, <13> 7.3002, <14> 28.3112, <15> 5.0128, <16> 38.1097, <17> 39.2782, <18> 27.3144, <19> 25.3965, <20> 32.8332;
param workload[JOB] := <1> 7.0505, <2> 5.3985, <3> 5.8048, <4> 5.065, <5> 4.8819, <6> 4.0224, <7> 3.559, <8> 3.8107, <9> 3.7556, <10> 3.2248, <11> 6.979, <12> 2.3133, <13> 2.7019, <14> 5.3208, <15> 2.2389, <16> 6.1733, <17> 6.2672, <18> 5.2263, <19> 5.0395, <20> 5.73;
param capacity[MACHINE] := <1> 13.5091, <2> 13.5091, <3> 13.5091, <4> 13.5091, <5> 13.5091, <6> 13.5091, <7> 13.5091;

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
