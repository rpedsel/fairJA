set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8671, <2> 29.3115, <3> 35.3265, <4> 32.2684, <5> 13.95, <6> 20.4349, <7> 44.9674, <8> 39.7234, <9> 16.3425, <10> 16.9853;
param workload[JOB] := <1> 15.0346, <2> 16.2377, <3> 22.1526, <4> 40.7502, <5> 38.759, <6> 13.6299, <7> 30.5927, <8> 19.145, <9> 22.1718, <10> 11.7587;
param capacity[MACHINE] := <1> 57.5581, <2> 57.5581, <3> 57.5581;

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
