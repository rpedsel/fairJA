set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.63, <2> 12.4094, <3> 11.1551, <4> 2.4915, <5> 21.2322, <6> 20.9665, <7> 31.4093, <8> 47.5178, <9> 4.035, <10> 12.2588;
param workload[JOB] := <1> 4.9629, <2> 3.5227, <3> 3.3399, <4> 1.5784, <5> 4.6078, <6> 4.5789, <7> 5.6044, <8> 6.8933, <9> 2.0087, <10> 3.5013;
param capacity[MACHINE] := <1> 10.1496, <2> 10.1496, <3> 10.1496;

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
