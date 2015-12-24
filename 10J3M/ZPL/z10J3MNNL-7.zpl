set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5837, <2> 24.7973, <3> 28.4951, <4> 25.228, <5> 17.3769, <6> 20.4424, <7> 17.567, <8> 31.6474, <9> 25.1517, <10> 18.2435;
param workload[JOB] := <1> 23.5837, <2> 24.7973, <3> 28.4951, <4> 25.228, <5> 17.3769, <6> 20.4424, <7> 17.567, <8> 31.6474, <9> 25.1517, <10> 18.2435;
param capacity[MACHINE] := <1> 232.533, <2> 232.533, <3> 232.533;

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
