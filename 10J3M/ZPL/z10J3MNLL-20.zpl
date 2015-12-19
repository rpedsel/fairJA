set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8244, <2> 22.9053, <3> 30.6367, <4> 27.056, <5> 21.4784, <6> 28.264, <7> 23.2172, <8> 30.045, <9> 20.6921, <10> 18.6133;
param workload[JOB] := <1> 28.8244, <2> 22.9053, <3> 30.6367, <4> 27.056, <5> 21.4784, <6> 28.264, <7> 23.2172, <8> 30.045, <9> 20.6921, <10> 18.6133;
param capacity[MACHINE] := <1> 83.9108, <2> 83.9108, <3> 83.9108;

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
