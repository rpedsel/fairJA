set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.7908, <2> 28.8867, <3> 18.8929, <4> 20.0648, <5> 18.8266, <6> 22.9087, <7> 25.4897, <8> 18.0892, <9> 27.0812, <10> 27.8672;
param workload[JOB] := <1> 20.7908, <2> 28.8867, <3> 18.8929, <4> 20.0648, <5> 18.8266, <6> 22.9087, <7> 25.4897, <8> 18.0892, <9> 27.0812, <10> 27.8672;
param capacity[MACHINE] := <1> 76.2993, <2> 76.2993, <3> 76.2993;

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
