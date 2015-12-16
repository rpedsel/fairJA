set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.0314, <2> 39.303, <3> 48.5151, <4> 33.6379, <5> 42.3803, <6> 18.5874, <7> 10.7446, <8> 20.1932, <9> 46.7776, <10> 11.4478;
param workload[JOB] := <1> 41.0314, <2> 39.303, <3> 48.5151, <4> 33.6379, <5> 42.3803, <6> 18.5874, <7> 10.7446, <8> 20.1932, <9> 46.7776, <10> 11.4478;
param capacity[MACHINE] := <1> 312.6183, <2> 312.6183, <3> 312.6183;

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
