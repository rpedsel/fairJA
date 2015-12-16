set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.1784, <2> 35.9795, <3> 29.5082, <4> 22.2577, <5> 33.0908, <6> 28.1793, <7> 38.2765, <8> 22.134, <9> 14.3322, <10> 23.0358;
param workload[JOB] := <1> 16.1784, <2> 35.9795, <3> 29.5082, <4> 22.2577, <5> 33.0908, <6> 28.1793, <7> 38.2765, <8> 22.134, <9> 14.3322, <10> 23.0358;
param capacity[MACHINE] := <1> 262.9724, <2> 262.9724, <3> 262.9724;

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
