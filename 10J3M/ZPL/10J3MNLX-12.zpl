set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0046, <2> 30.3076, <3> 27.2028, <4> 24.3436, <5> 19.9532, <6> 27.0045, <7> 27.8286, <8> 22.6429, <9> 20.2595, <10> 20.5114;
param workload[JOB] := <1> 4.8994, <2> 5.5052, <3> 5.2156, <4> 4.9339, <5> 4.4669, <6> 5.1966, <7> 5.2753, <8> 4.7585, <9> 4.5011, <10> 4.529;
param capacity[MACHINE] := <1> 16.4272, <2> 16.4272, <3> 16.4272;

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
