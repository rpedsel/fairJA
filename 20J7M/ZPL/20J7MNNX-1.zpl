set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.7106, <2> 30.3825, <3> 28.018, <4> 30.8736, <5> 17.8041, <6> 24.2847, <7> 23.581, <8> 29.9081, <9> 33.0564, <10> 26.7859, <11> 23.923, <12> 10.7594, <13> 29.3999, <14> 23.6754, <15> 27.0493, <16> 15.8221, <17> 22.1651, <18> 20.4247, <19> 20.4599, <20> 26.2768;
param workload[JOB] := <1> 4.971, <2> 5.512, <3> 5.2932, <4> 5.5564, <5> 4.2195, <6> 4.928, <7> 4.856, <8> 5.4688, <9> 5.7495, <10> 5.1755, <11> 4.8911, <12> 3.2802, <13> 5.4222, <14> 4.8657, <15> 5.2009, <16> 3.9777, <17> 4.708, <18> 4.5194, <19> 4.5233, <20> 5.1261;
param capacity[MACHINE] := <1> 98.2445, <2> 98.2445, <3> 98.2445, <4> 98.2445, <5> 98.2445, <6> 98.2445, <7> 98.2445;

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
