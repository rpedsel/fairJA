set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.3363, <2> 27.7247, <3> 40.0408, <4> 45.5162, <5> 26.0541, <6> 13.7265, <7> 29.7057, <8> 28.5556, <9> 8.488, <10> 28.255;
param workload[JOB] := <1> 6.4293, <2> 5.2654, <3> 6.3278, <4> 6.7466, <5> 5.1043, <6> 3.7049, <7> 5.4503, <8> 5.3437, <9> 2.9134, <10> 5.3155;
param capacity[MACHINE] := <1> 52.6012, <2> 52.6012, <3> 52.6012;

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
