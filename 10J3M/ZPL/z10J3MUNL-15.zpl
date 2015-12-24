set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.213, <2> 5.4729, <3> 2.9882, <4> 40.9558, <5> 21.6824, <6> 42.5568, <7> 7.3855, <8> 29.2535, <9> 19.8797, <10> 21.9353;
param workload[JOB] := <1> 23.213, <2> 5.4729, <3> 2.9882, <4> 40.9558, <5> 21.6824, <6> 42.5568, <7> 7.3855, <8> 29.2535, <9> 19.8797, <10> 21.9353;
param capacity[MACHINE] := <1> 215.3231, <2> 215.3231, <3> 215.3231;

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
