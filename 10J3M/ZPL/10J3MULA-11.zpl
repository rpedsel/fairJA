set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.343, <2> 2.5325, <3> 17.9304, <4> 31.8366, <5> 8.3884, <6> 36.5973, <7> 6.5769, <8> 37.5767, <9> 29.3937, <10> 33.2363;
param workload[JOB] := <1> 693.9536, <2> 6.4136, <3> 321.4992, <4> 1013.5691, <5> 70.3653, <6> 1339.3624, <7> 43.2556, <8> 1412.0084, <9> 863.9896, <10> 1104.6516;
param capacity[MACHINE] := <1> 2289.6895, <2> 2289.6895, <3> 2289.6895;

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
