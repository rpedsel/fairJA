set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.6197, <2> 13.818, <3> 30.0988, <4> 5.8433, <5> 34.9605, <6> 30.3169, <7> 11.7726, <8> 24.281, <9> 2.349, <10> 2.1791;
param workload[JOB] := <1> 4.3151, <2> 3.7173, <3> 5.4862, <4> 2.4173, <5> 5.9127, <6> 5.5061, <7> 3.4311, <8> 4.9276, <9> 1.5326, <10> 1.4762;
param capacity[MACHINE] := <1> 9.6806, <2> 9.6806, <3> 9.6806;

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
