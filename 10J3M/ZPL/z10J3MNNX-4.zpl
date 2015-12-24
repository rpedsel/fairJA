set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.4997, <2> 32.4423, <3> 24.4567, <4> 29.0753, <5> 21.7876, <6> 20.9543, <7> 26.7287, <8> 23.8278, <9> 24.9277, <10> 26.8574;
param workload[JOB] := <1> 4.5277, <2> 5.6958, <3> 4.9454, <4> 5.3922, <5> 4.6677, <6> 4.5776, <7> 5.17, <8> 4.8814, <9> 4.9928, <10> 5.1824;
param capacity[MACHINE] := <1> 50.033, <2> 50.033, <3> 50.033;

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
