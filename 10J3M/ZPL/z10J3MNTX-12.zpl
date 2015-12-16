set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0553, <2> 26.481, <3> 18.5193, <4> 25.0779, <5> 31.3487, <6> 19.4701, <7> 26.2648, <8> 29.9777, <9> 30.1629, <10> 34.858;
param workload[JOB] := <1> 4.6963, <2> 5.146, <3> 4.3034, <4> 5.0078, <5> 5.599, <6> 4.4125, <7> 5.1249, <8> 5.4752, <9> 5.4921, <10> 5.9041;
param capacity[MACHINE] := <1> 12.7904, <2> 12.7904, <3> 12.7904;

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
