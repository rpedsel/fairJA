set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.8581, <2> 27.0024, <3> 19.4206, <4> 45.0482, <5> 9.3438, <6> 12.57, <7> 35.8096, <8> 22.8377, <9> 35.9437, <10> 49.9998;
param workload[JOB] := <1> 2.6188, <2> 5.1964, <3> 4.4069, <4> 6.7118, <5> 3.0568, <6> 3.5454, <7> 5.9841, <8> 4.7789, <9> 5.9953, <10> 7.0711;
param capacity[MACHINE] := <1> 49.3655, <2> 49.3655, <3> 49.3655;

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
