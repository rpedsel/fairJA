set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.8081, <2> 23.1892, <3> 27.4997, <4> 26.3815, <5> 20.6721, <6> 21.7835, <7> 20.4615, <8> 13.5309, <9> 22.2977, <10> 28.0545;
param workload[JOB] := <1> 949.139, <2> 537.739, <3> 756.2335, <4> 695.9835, <5> 427.3357, <6> 474.5209, <7> 418.673, <8> 183.0853, <9> 497.1874, <10> 787.055;
param capacity[MACHINE] := <1> 5726.9523, <2> 5726.9523, <3> 5726.9523;

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
