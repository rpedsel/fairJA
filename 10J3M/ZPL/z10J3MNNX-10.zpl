set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.9495, <2> 23.5765, <3> 30.4264, <4> 30.4411, <5> 26.3527, <6> 22.6284, <7> 14.8367, <8> 23.2155, <9> 17.3078, <10> 28.7813;
param workload[JOB] := <1> 5.0941, <2> 4.8556, <3> 5.516, <4> 5.5173, <5> 5.1335, <6> 4.7569, <7> 3.8518, <8> 4.8182, <9> 4.1603, <10> 5.3648;
param capacity[MACHINE] := <1> 49.0685, <2> 49.0685, <3> 49.0685;

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
