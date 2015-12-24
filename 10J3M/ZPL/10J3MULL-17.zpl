set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.833, <2> 43.8633, <3> 35.4328, <4> 4.4987, <5> 44.9441, <6> 28.2903, <7> 47.8549, <8> 26.4551, <9> 0.0339, <10> 14.4063;
param workload[JOB] := <1> 17.833, <2> 43.8633, <3> 35.4328, <4> 4.4987, <5> 44.9441, <6> 28.2903, <7> 47.8549, <8> 26.4551, <9> 0.0339, <10> 14.4063;
param capacity[MACHINE] := <1> 87.8708, <2> 87.8708, <3> 87.8708;

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
