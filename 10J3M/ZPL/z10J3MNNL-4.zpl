set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1905, <2> 30.1333, <3> 23.3911, <4> 25.6482, <5> 27.0495, <6> 23.259, <7> 18.2338, <8> 24.3526, <9> 21.7671, <10> 30.1652;
param workload[JOB] := <1> 26.1905, <2> 30.1333, <3> 23.3911, <4> 25.6482, <5> 27.0495, <6> 23.259, <7> 18.2338, <8> 24.3526, <9> 21.7671, <10> 30.1652;
param capacity[MACHINE] := <1> 250.1903, <2> 250.1903, <3> 250.1903;

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
