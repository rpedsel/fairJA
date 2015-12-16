set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.5787, <2> 36.702, <3> 0.4745, <4> 10.1416, <5> 46.8526, <6> 37.8961, <7> 1.8668, <8> 49.9965, <9> 36.1609, <10> 19.1469;
param workload[JOB] := <1> 654.2699, <2> 1347.0368, <3> 0.2252, <4> 102.8521, <5> 2195.1661, <6> 1436.1144, <7> 3.4849, <8> 2499.65, <9> 1307.6107, <10> 366.6038;
param capacity[MACHINE] := <1> 2478.2535, <2> 2478.2535, <3> 2478.2535;

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
