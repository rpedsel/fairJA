set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.5656, <2> 23.7554, <3> 31.095, <4> 29.5906, <5> 27.5434, <6> 23.9887, <7> 27.0892, <8> 18.0613, <9> 27.9986, <10> 27.4864;
param workload[JOB] := <1> 27.5656, <2> 23.7554, <3> 31.095, <4> 29.5906, <5> 27.5434, <6> 23.9887, <7> 27.0892, <8> 18.0613, <9> 27.9986, <10> 27.4864;
param capacity[MACHINE] := <1> 88.0581, <2> 88.0581, <3> 88.0581;

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
