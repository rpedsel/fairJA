set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0457, <2> 21.043, <3> 18.466, <4> 14.6866, <5> 20.585, <6> 27.2877, <7> 28.9419, <8> 24.502, <9> 28.5963, <10> 35.2724;
param workload[JOB] := <1> 442.9215, <2> 442.8078, <3> 340.9932, <4> 215.6962, <5> 423.7422, <6> 744.6186, <7> 837.6336, <8> 600.348, <9> 817.7484, <10> 1244.1422;
param capacity[MACHINE] := <1> 1527.6629, <2> 1527.6629, <3> 1527.6629;

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
