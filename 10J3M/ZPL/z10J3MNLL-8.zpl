set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6615, <2> 22.8174, <3> 30.9433, <4> 28.1564, <5> 26.2086, <6> 19.9465, <7> 20.859, <8> 20.5601, <9> 28.0446, <10> 18.3033;
param workload[JOB] := <1> 27.6615, <2> 22.8174, <3> 30.9433, <4> 28.1564, <5> 26.2086, <6> 19.9465, <7> 20.859, <8> 20.5601, <9> 28.0446, <10> 18.3033;
param capacity[MACHINE] := <1> 81.1669, <2> 81.1669, <3> 81.1669;

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
