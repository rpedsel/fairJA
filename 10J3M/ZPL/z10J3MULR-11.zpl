set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.6566, <2> 30.817, <3> 22.7173, <4> 11.301, <5> 28.2905, <6> 43.2103, <7> 30.748, <8> 45.6279, <9> 12.8051, <10> 44.499;
param workload[JOB] := <1> 37.7309, <2> 9.7648, <3> 14.469, <4> 4.8236, <5> 32.5782, <6> 38.0246, <7> 45.034, <8> 49.9864, <9> 19.4909, <10> 25.8371;
param capacity[MACHINE] := <1> 92.5798, <2> 92.5798, <3> 92.5798;

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
