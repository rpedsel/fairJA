set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.2931, <2> 14.0829, <3> 24.4822, <4> 18.4537, <5> 29.5513, <6> 29.7871, <7> 26.6565, <8> 24.1938, <9> 29.8836, <10> 23.0955;
param workload[JOB] := <1> 5.5039, <2> 3.7527, <3> 4.9479, <4> 4.2958, <5> 5.4361, <6> 5.4578, <7> 5.163, <8> 4.9187, <9> 5.4666, <10> 4.8058;
param capacity[MACHINE] := <1> 12.4371, <2> 12.4371, <3> 12.4371;

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
