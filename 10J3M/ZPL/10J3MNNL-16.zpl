set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.2504, <2> 24.3737, <3> 19.2848, <4> 22.6588, <5> 23.6841, <6> 26.857, <7> 20.7034, <8> 25.5071, <9> 27.8478, <10> 22.8991;
param workload[JOB] := <1> 23.2504, <2> 24.3737, <3> 19.2848, <4> 22.6588, <5> 23.6841, <6> 26.857, <7> 20.7034, <8> 25.5071, <9> 27.8478, <10> 22.8991;
param capacity[MACHINE] := <1> 237.0662, <2> 237.0662, <3> 237.0662;

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
