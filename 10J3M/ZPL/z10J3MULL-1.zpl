set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.9986, <2> 33.6272, <3> 27.4514, <4> 46.7644, <5> 36.043, <6> 35.7998, <7> 0.2937, <8> 29.0455, <9> 27.0537, <10> 37.094;
param workload[JOB] := <1> 16.9986, <2> 33.6272, <3> 27.4514, <4> 46.7644, <5> 36.043, <6> 35.7998, <7> 0.2937, <8> 29.0455, <9> 27.0537, <10> 37.094;
param capacity[MACHINE] := <1> 96.7238, <2> 96.7238, <3> 96.7238;

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
