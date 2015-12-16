set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1848, <2> 21.7023, <3> 28.0276, <4> 23.2774, <5> 23.6979, <6> 25.6263, <7> 29.6826, <8> 25.9225, <9> 30.6984, <10> 24.2256;
param workload[JOB] := <1> 368.0566, <2> 470.9898, <3> 785.5464, <4> 541.8374, <5> 561.5905, <6> 656.7073, <7> 881.0567, <8> 671.976, <9> 942.3918, <10> 586.8797;
param capacity[MACHINE] := <1> 2155.6774, <2> 2155.6774, <3> 2155.6774;

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
