set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.887, <2> 40.0027, <3> 35.3221, <4> 35.5216, <5> 33.8804, <6> 33.1094, <7> 20.5002, <8> 1.7504, <9> 49.8393, <10> 21.4816;
param workload[JOB] := <1> 28.887, <2> 40.0027, <3> 35.3221, <4> 35.5216, <5> 33.8804, <6> 33.1094, <7> 20.5002, <8> 1.7504, <9> 49.8393, <10> 21.4816;
param capacity[MACHINE] := <1> 75.0737, <2> 75.0737, <3> 75.0737;

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
