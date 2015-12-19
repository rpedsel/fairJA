set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4922, <2> 25.5492, <3> 27.1429, <4> 22.3392, <5> 24.7454, <6> 25.5199, <7> 30.1368, <8> 29.956, <9> 20.6314, <10> 33.1848;
param workload[JOB] := <1> 26.4922, <2> 25.5492, <3> 27.1429, <4> 22.3392, <5> 24.7454, <6> 25.5199, <7> 30.1368, <8> 29.956, <9> 20.6314, <10> 33.1848;
param capacity[MACHINE] := <1> 66.4244, <2> 66.4244, <3> 66.4244;

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
