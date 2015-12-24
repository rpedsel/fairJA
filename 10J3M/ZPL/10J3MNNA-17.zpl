set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0544, <2> 23.8632, <3> 23.272, <4> 20.6706, <5> 21.4246, <6> 25.4157, <7> 19.7301, <8> 32.6671, <9> 22.9485, <10> 18.43;
param workload[JOB] := <1> 627.723, <2> 569.4523, <3> 541.586, <4> 427.2737, <5> 459.0135, <6> 645.9578, <7> 389.2768, <8> 1067.1394, <9> 526.6337, <10> 339.6649;
param capacity[MACHINE] := <1> 5593.7211, <2> 5593.7211, <3> 5593.7211;

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
