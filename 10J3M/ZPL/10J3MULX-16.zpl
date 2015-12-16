set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.0606, <2> 3.4338, <3> 22.7197, <4> 16.7885, <5> 39.7045, <6> 9.2788, <7> 17.9677, <8> 30.8691, <9> 36.7833, <10> 34.6219;
param workload[JOB] := <1> 5.7498, <2> 1.8531, <3> 4.7665, <4> 4.0974, <5> 6.3012, <6> 3.0461, <7> 4.2388, <8> 5.556, <9> 6.0649, <10> 5.884;
param capacity[MACHINE] := <1> 15.8526, <2> 15.8526, <3> 15.8526;

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
