set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.4075, <2> 28.7079, <3> 21.4459, <4> 21.536, <5> 18.3108, <6> 26.4899, <7> 32.7542, <8> 21.1678, <9> 19.0819, <10> 18.6488;
param workload[JOB] := <1> 28.4075, <2> 28.7079, <3> 21.4459, <4> 21.536, <5> 18.3108, <6> 26.4899, <7> 32.7542, <8> 21.1678, <9> 19.0819, <10> 18.6488;
param capacity[MACHINE] := <1> 236.5507, <2> 236.5507, <3> 236.5507;

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
