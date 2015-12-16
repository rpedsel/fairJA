set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.0822, <2> 43.3372, <3> 32.0311, <4> 16.0431, <5> 43.945, <6> 40.9472, <7> 26.6294, <8> 13.0489, <9> 15.0544, <10> 36.9034;
param workload[JOB] := <1> 1230.7608, <2> 1878.1129, <3> 1025.9914, <4> 257.3811, <5> 1931.163, <6> 1676.6732, <7> 709.1249, <8> 170.2738, <9> 226.635, <10> 1361.8609;
param capacity[MACHINE] := <1> 3489.3257, <2> 3489.3257, <3> 3489.3257;

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
