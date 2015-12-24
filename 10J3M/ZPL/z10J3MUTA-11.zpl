set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3877, <2> 40.7625, <3> 2.363, <4> 34.6479, <5> 11.07, <6> 29.4726, <7> 40.0398, <8> 28.4083, <9> 25.809, <10> 36.6359;
param workload[JOB] := <1> 696.3107, <2> 1661.5814, <3> 5.5838, <4> 1200.477, <5> 122.5449, <6> 868.6342, <7> 1603.1856, <8> 807.0315, <9> 666.1045, <10> 1342.1892;
param capacity[MACHINE] := <1> 2243.4107, <2> 2243.4107, <3> 2243.4107;

var x[JM] binary;
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
