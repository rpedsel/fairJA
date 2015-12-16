set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.9281, <2> 30.0301, <3> 30.8305, <4> 20.0944, <5> 23.328, <6> 24.7641, <7> 25.5251, <8> 24.9061, <9> 22.0044, <10> 21.7028;
param workload[JOB] := <1> 30.9281, <2> 30.0301, <3> 30.8305, <4> 20.0944, <5> 23.328, <6> 24.7641, <7> 25.5251, <8> 24.9061, <9> 22.0044, <10> 21.7028;
param capacity[MACHINE] := <1> 254.1136, <2> 254.1136, <3> 254.1136;

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
