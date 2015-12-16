set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0603, <2> 23.3102, <3> 25.8295, <4> 12.028, <5> 25.7046, <6> 24.2546, <7> 26.6355, <8> 23.434, <9> 28.1039, <10> 25.4532;
param workload[JOB] := <1> 5.3908, <2> 4.8281, <3> 5.0823, <4> 3.4681, <5> 5.07, <6> 4.9249, <7> 5.161, <8> 4.8409, <9> 5.3013, <10> 5.0451;
param capacity[MACHINE] := <1> 12.2781, <2> 12.2781, <3> 12.2781;

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
