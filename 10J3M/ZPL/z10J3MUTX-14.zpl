set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.5999, <2> 47.9032, <3> 33.7365, <4> 23.3792, <5> 14.9822, <6> 22.5915, <7> 0.9099, <8> 5.3674, <9> 18.2416, <10> 27.0852;
param workload[JOB] := <1> 5.8822, <2> 6.9212, <3> 5.8083, <4> 4.8352, <5> 3.8707, <6> 4.7531, <7> 0.9539, <8> 2.3168, <9> 4.271, <10> 5.2043;
param capacity[MACHINE] := <1> 11.2042, <2> 11.2042, <3> 11.2042;

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
