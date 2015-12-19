set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.3083, <2> 44.2283, <3> 0.9607, <4> 35.2915, <5> 26.7633, <6> 33.0767, <7> 12.749, <8> 7.4872, <9> 22.2635, <10> 41.9029;
param workload[JOB] := <1> 5.8573, <2> 6.6504, <3> 0.9802, <4> 5.9407, <5> 5.1733, <6> 5.7512, <7> 3.5706, <8> 2.7363, <9> 4.7184, <10> 6.4732;
param capacity[MACHINE] := <1> 15.9505, <2> 15.9505, <3> 15.9505;

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
