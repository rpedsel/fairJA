set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.7479, <2> 20.8435, <3> 17.6206, <4> 32.0117, <5> 25.0488, <6> 25.4965, <7> 23.7778, <8> 27.1676, <9> 25.2247, <10> 29.2163;
param workload[JOB] := <1> 612.4586, <2> 434.4515, <3> 310.4855, <4> 1024.7489, <5> 627.4424, <6> 650.0715, <7> 565.3838, <8> 738.0785, <9> 636.2855, <10> 853.5922;
param capacity[MACHINE] := <1> 6452.9984, <2> 6452.9984, <3> 6452.9984;

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
