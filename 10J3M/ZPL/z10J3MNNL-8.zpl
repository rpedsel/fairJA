set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.4696, <2> 27.2064, <3> 28.9184, <4> 19.523, <5> 20.6112, <6> 32.8697, <7> 33.3104, <8> 20.8716, <9> 16.9115, <10> 23.4327;
param workload[JOB] := <1> 19.4696, <2> 27.2064, <3> 28.9184, <4> 19.523, <5> 20.6112, <6> 32.8697, <7> 33.3104, <8> 20.8716, <9> 16.9115, <10> 23.4327;
param capacity[MACHINE] := <1> 243.1245, <2> 243.1245, <3> 243.1245;

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
