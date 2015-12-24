set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5328, <2> 6.6585, <3> 19.6, <4> 37.4608, <5> 49.4579, <6> 20.1825, <7> 38.9216, <8> 4.6889, <9> 3.8304, <10> 42.2069;
param workload[JOB] := <1> 4.9531, <2> 2.5804, <3> 4.4272, <4> 6.1205, <5> 7.0326, <6> 4.4925, <7> 6.2387, <8> 2.1654, <9> 1.9571, <10> 6.4967;
param capacity[MACHINE] := <1> 15.4881, <2> 15.4881, <3> 15.4881;

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
