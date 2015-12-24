set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8856, <2> 25.1458, <3> 30.399, <4> 15.7625, <5> 23.5224, <6> 25.3565, <7> 24.6499, <8> 30.4462, <9> 19.409, <10> 18.5246;
param workload[JOB] := <1> 19.8856, <2> 25.1458, <3> 30.399, <4> 15.7625, <5> 23.5224, <6> 25.3565, <7> 24.6499, <8> 30.4462, <9> 19.409, <10> 18.5246;
param capacity[MACHINE] := <1> 77.7005, <2> 77.7005, <3> 77.7005;

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
