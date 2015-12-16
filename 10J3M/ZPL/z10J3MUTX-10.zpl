set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.1477, <2> 8.8497, <3> 20.1525, <4> 44.3161, <5> 23.1794, <6> 18.0918, <7> 1.8301, <8> 48.4918, <9> 49.4286, <10> 18.258;
param workload[JOB] := <1> 2.8544, <2> 2.9748, <3> 4.4892, <4> 6.657, <5> 4.8145, <6> 4.2534, <7> 1.3528, <8> 6.9636, <9> 7.0305, <10> 4.2729;
param capacity[MACHINE] := <1> 11.4157, <2> 11.4157, <3> 11.4157;

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
