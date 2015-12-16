set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2289, <2> 29.0352, <3> 18.9741, <4> 12.9865, <5> 23.4026, <6> 27.2045, <7> 32.6779, <8> 24.0187, <9> 29.8278, <10> 16.629;
param workload[JOB] := <1> 5.0228, <2> 5.3884, <3> 4.3559, <4> 3.6037, <5> 4.8376, <6> 5.2158, <7> 5.7165, <8> 4.9009, <9> 5.4615, <10> 4.0779;
param capacity[MACHINE] := <1> 16.1937, <2> 16.1937, <3> 16.1937;

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
