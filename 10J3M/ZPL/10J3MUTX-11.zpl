set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.0592, <2> 16.9144, <3> 48.0049, <4> 38.4189, <5> 45.4433, <6> 3.8051, <7> 25.0826, <8> 44.7823, <9> 11.6321, <10> 12.8006;
param workload[JOB] := <1> 5.2018, <2> 4.1127, <3> 6.9286, <4> 6.1983, <5> 6.7412, <6> 1.9507, <7> 5.0083, <8> 6.692, <9> 3.4106, <10> 3.5778;
param capacity[MACHINE] := <1> 12.4555, <2> 12.4555, <3> 12.4555;

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
