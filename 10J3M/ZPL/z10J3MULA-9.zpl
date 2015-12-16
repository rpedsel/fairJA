set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.1066, <2> 31.2884, <3> 5.1573, <4> 43.506, <5> 47.0771, <6> 31.9899, <7> 21.2177, <8> 19.3246, <9> 12.3213, <10> 21.0339;
param workload[JOB] := <1> 259.4226, <2> 978.964, <3> 26.5977, <4> 1892.772, <5> 2216.2533, <6> 1023.3537, <7> 450.1908, <8> 373.4402, <9> 151.8144, <10> 442.4249;
param capacity[MACHINE] := <1> 2605.0779, <2> 2605.0779, <3> 2605.0779;

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
