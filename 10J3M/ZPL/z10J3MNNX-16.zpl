set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.3206, <2> 26.6452, <3> 26.5236, <4> 31.0911, <5> 25.3494, <6> 24.4448, <7> 28.25, <8> 23.3794, <9> 28.3845, <10> 24.763;
param workload[JOB] := <1> 5.9431, <2> 5.1619, <3> 5.1501, <4> 5.5759, <5> 5.0348, <6> 4.9442, <7> 5.3151, <8> 4.8352, <9> 5.3277, <10> 4.9762;
param capacity[MACHINE] := <1> 52.2642, <2> 52.2642, <3> 52.2642;

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
