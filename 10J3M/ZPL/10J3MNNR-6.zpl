set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2058, <2> 15.8751, <3> 18.0729, <4> 21.2004, <5> 27.1895, <6> 28.3938, <7> 18.2781, <8> 28.2574, <9> 22.2933, <10> 24.8895;
param workload[JOB] := <1> 36.2726, <2> 34.7835, <3> 5.3271, <4> 41.3475, <5> 14.7237, <6> 9.6336, <7> 41.5846, <8> 8.5101, <9> 44.1284, <10> 34.34;
param capacity[MACHINE] := <1> 270.6511, <2> 270.6511, <3> 270.6511;

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
