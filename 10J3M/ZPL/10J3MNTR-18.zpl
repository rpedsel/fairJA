set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.7198, <2> 23.5787, <3> 16.4717, <4> 23.4189, <5> 23.9061, <6> 28.9039, <7> 33.183, <8> 18.1164, <9> 23.6584, <10> 29.4455;
param workload[JOB] := <1> 35.543, <2> 13.7286, <3> 19.2137, <4> 17.0026, <5> 40.3767, <6> 8.2027, <7> 33.6023, <8> 4.9671, <9> 31.9107, <10> 6.5502;
param capacity[MACHINE] := <1> 52.7744, <2> 52.7744, <3> 52.7744;

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
