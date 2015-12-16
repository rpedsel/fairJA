set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.6319, <2> 11.502, <3> 13.8269, <4> 37.8669, <5> 17.5724, <6> 26.1682, <7> 20.9657, <8> 2.6039, <9> 34.0185, <10> 6.9869;
param workload[JOB] := <1> 6.5293, <2> 3.3915, <3> 3.7185, <4> 6.1536, <5> 4.1919, <6> 5.1155, <7> 4.5788, <8> 1.6137, <9> 5.8325, <10> 2.6433;
param capacity[MACHINE] := <1> 10.9421, <2> 10.9421, <3> 10.9421;

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
