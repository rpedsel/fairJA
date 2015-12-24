set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.1727, <2> 28.8436, <3> 21.7438, <4> 19.3165, <5> 24.6469, <6> 14.8091, <7> 16.8741, <8> 30.6822, <9> 34.4546, <10> 26.6206;
param workload[JOB] := <1> 16.1727, <2> 28.8436, <3> 21.7438, <4> 19.3165, <5> 24.6469, <6> 14.8091, <7> 16.8741, <8> 30.6822, <9> 34.4546, <10> 26.6206;
param capacity[MACHINE] := <1> 78.0547, <2> 78.0547, <3> 78.0547;

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
