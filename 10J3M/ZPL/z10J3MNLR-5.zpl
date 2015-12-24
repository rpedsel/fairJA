set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.3332, <2> 23.5483, <3> 25.7754, <4> 20.822, <5> 26.7169, <6> 26.0593, <7> 23.0113, <8> 16.0829, <9> 34.1654, <10> 25.5353;
param workload[JOB] := <1> 13.2206, <2> 7.0099, <3> 33.1394, <4> 2.3355, <5> 23.6989, <6> 29.3501, <7> 30.6859, <8> 31.5648, <9> 32.874, <10> 30.6572;
param capacity[MACHINE] := <1> 78.1788, <2> 78.1788, <3> 78.1788;

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
