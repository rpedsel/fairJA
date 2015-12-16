set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.3407, <2> 21.0805, <3> 34.974, <4> 24.7265, <5> 27.8726, <6> 22.0217, <7> 28.4879, <8> 23.8419, <9> 37.4292, <10> 17.2971;
param workload[JOB] := <1> 1320.6465, <2> 444.3875, <3> 1223.1807, <4> 611.3998, <5> 776.8818, <6> 484.9553, <7> 811.5604, <8> 568.4362, <9> 1400.945, <10> 299.1897;
param capacity[MACHINE] := <1> 2647.1943, <2> 2647.1943, <3> 2647.1943;

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
