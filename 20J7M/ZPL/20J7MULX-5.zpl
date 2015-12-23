set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3744, <2> 22.0568, <3> 17.6336, <4> 4.0224, <5> 39.3631, <6> 2.9832, <7> 8.5802, <8> 17.4978, <9> 23.5134, <10> 45.6162, <11> 47.0438, <12> 27.3488, <13> 44.7523, <14> 0.3953, <15> 42.8007, <16> 4.6623, <17> 7.262, <18> 15.8821, <19> 36.9912, <20> 3.3156;
param workload[JOB] := <1> 4.7302, <2> 4.6965, <3> 4.1992, <4> 2.0056, <5> 6.274, <6> 1.7272, <7> 2.9292, <8> 4.183, <9> 4.8491, <10> 6.754, <11> 6.8588, <12> 5.2296, <13> 6.6897, <14> 0.6287, <15> 6.5422, <16> 2.1592, <17> 2.6948, <18> 3.9852, <19> 6.082, <20> 1.8209;
param capacity[MACHINE] := <1> 12.1484, <2> 12.1484, <3> 12.1484, <4> 12.1484, <5> 12.1484, <6> 12.1484, <7> 12.1484;

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
