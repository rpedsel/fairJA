set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.4975, <2> 18.4479, <3> 46.9239, <4> 1.3951, <5> 37.5351, <6> 1.9503, <7> 28.0638, <8> 8.3631, <9> 14.14, <10> 26.4626;
param workload[JOB] := <1> 3.3908, <2> 4.2951, <3> 6.8501, <4> 1.1811, <5> 6.1266, <6> 1.3965, <7> 5.2975, <8> 2.8919, <9> 3.7603, <10> 5.1442;
param capacity[MACHINE] := <1> 13.4447, <2> 13.4447, <3> 13.4447;

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
