set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.9824, <2> 26.4986, <3> 8.265, <4> 21.1888, <5> 29.244, <6> 2.2725, <7> 17.0462, <8> 46.6685, <9> 15.6371, <10> 29.1132;
param workload[JOB] := <1> 4.4702, <2> 5.1477, <3> 2.8749, <4> 4.6031, <5> 5.4078, <6> 1.5075, <7> 4.1287, <8> 6.8314, <9> 3.9544, <10> 5.3957;
param capacity[MACHINE] := <1> 44.3214, <2> 44.3214, <3> 44.3214;

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
