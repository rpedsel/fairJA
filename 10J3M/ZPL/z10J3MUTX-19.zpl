set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.823, <2> 25.7475, <3> 17.7114, <4> 32.4636, <5> 41.73, <6> 43.9523, <7> 17.11, <8> 8.6464, <9> 0.9482, <10> 22.4078;
param workload[JOB] := <1> 3.4385, <2> 5.0742, <3> 4.2085, <4> 5.6977, <5> 6.4599, <6> 6.6297, <7> 4.1364, <8> 2.9405, <9> 0.9738, <10> 4.7337;
param capacity[MACHINE] := <1> 11.0732, <2> 11.0732, <3> 11.0732;

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
