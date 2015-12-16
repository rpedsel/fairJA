set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.3853, <2> 24.8466, <3> 25.9841, <4> 25.6775, <5> 30.3647, <6> 38.6451, <7> 27.6584, <8> 32.8288, <9> 27.4725, <10> 19.7936;
param workload[JOB] := <1> 19.3853, <2> 24.8466, <3> 25.9841, <4> 25.6775, <5> 30.3647, <6> 38.6451, <7> 27.6584, <8> 32.8288, <9> 27.4725, <10> 19.7936;
param capacity[MACHINE] := <1> 272.6566, <2> 272.6566, <3> 272.6566;

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
