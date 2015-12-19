set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.7549, <2> 46.2108, <3> 20.8914, <4> 15.0605, <5> 32.4302, <6> 37.4949, <7> 26.4195, <8> 12.2169, <9> 45.0466, <10> 46.1803;
param workload[JOB] := <1> 14.2657, <2> 15.6757, <3> 44.6472, <4> 21.5853, <5> 30.2794, <6> 13.2349, <7> 14.2416, <8> 21.844, <9> 11.32, <10> 1.046;
param capacity[MACHINE] := <1> 62.7133, <2> 62.7133, <3> 62.7133;

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
