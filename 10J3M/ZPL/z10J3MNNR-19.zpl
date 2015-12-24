set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8852, <2> 31.1199, <3> 20.9463, <4> 33.684, <5> 21.4997, <6> 16.4973, <7> 20.1117, <8> 30.9226, <9> 33.3137, <10> 20.6771;
param workload[JOB] := <1> 22.2189, <2> 47.2242, <3> 28.1862, <4> 40.0215, <5> 15.0959, <6> 18.81, <7> 7.5042, <8> 2.7561, <9> 2.3342, <10> 39.1282;
param capacity[MACHINE] := <1> 223.2794, <2> 223.2794, <3> 223.2794;

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
