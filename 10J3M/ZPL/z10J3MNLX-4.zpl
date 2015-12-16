set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.6678, <2> 34.7254, <3> 21.2789, <4> 28.4863, <5> 29.421, <6> 32.8319, <7> 25.6325, <8> 19.4022, <9> 19.1648, <10> 24.3084;
param workload[JOB] := <1> 5.0663, <2> 5.8928, <3> 4.6129, <4> 5.3373, <5> 5.4241, <6> 5.7299, <7> 5.0629, <8> 4.4048, <9> 4.3778, <10> 4.9304;
param capacity[MACHINE] := <1> 16.9464, <2> 16.9464, <3> 16.9464;

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
