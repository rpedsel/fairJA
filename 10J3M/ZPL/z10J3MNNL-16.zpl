set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.1618, <2> 21.4869, <3> 24.8595, <4> 30.4511, <5> 28.4672, <6> 28.8531, <7> 16.9144, <8> 27.4302, <9> 23.5094, <10> 21.3349;
param workload[JOB] := <1> 28.1618, <2> 21.4869, <3> 24.8595, <4> 30.4511, <5> 28.4672, <6> 28.8531, <7> 16.9144, <8> 27.4302, <9> 23.5094, <10> 21.3349;
param capacity[MACHINE] := <1> 251.4685, <2> 251.4685, <3> 251.4685;

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
