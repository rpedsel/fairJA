set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.4315, <2> 39.9564, <3> 23.6919, <4> 27.0657, <5> 24.0485, <6> 26.2049, <7> 28.8911, <8> 22.9886, <9> 28.1293, <10> 22.0093;
param workload[JOB] := <1> 25.0751, <2> 24.2162, <3> 33.1745, <4> 45.3655, <5> 27.632, <6> 29.0876, <7> 39.4945, <8> 35.2984, <9> 3.9608, <10> 7.2696;
param capacity[MACHINE] := <1> 67.6436, <2> 67.6436, <3> 67.6436;

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
