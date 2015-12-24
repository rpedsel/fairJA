set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.1196, <2> 37.8043, <3> 47.9138, <4> 20.41, <5> 26.4087, <6> 16.4528, <7> 46.0978, <8> 31.8498, <9> 35.3054, <10> 34.6478;
param workload[JOB] := <1> 1530.3431, <2> 1429.1651, <3> 2295.7322, <4> 416.5681, <5> 697.4194, <6> 270.6946, <7> 2125.0072, <8> 1014.4098, <9> 1246.4713, <10> 1200.47;
param capacity[MACHINE] := <1> 12226.2808, <2> 12226.2808, <3> 12226.2808;

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
