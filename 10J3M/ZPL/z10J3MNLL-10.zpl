set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.1333, <2> 23.8113, <3> 21.8201, <4> 18.3861, <5> 14.6815, <6> 35.2425, <7> 29.6755, <8> 32.3981, <9> 31.3169, <10> 27.9326;
param workload[JOB] := <1> 21.1333, <2> 23.8113, <3> 21.8201, <4> 18.3861, <5> 14.6815, <6> 35.2425, <7> 29.6755, <8> 32.3981, <9> 31.3169, <10> 27.9326;
param capacity[MACHINE] := <1> 85.466, <2> 85.466, <3> 85.466;

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
