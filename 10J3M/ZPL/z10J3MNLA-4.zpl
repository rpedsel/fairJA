set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2173, <2> 23.1511, <3> 27.2081, <4> 23.0754, <5> 21.9955, <6> 25.1414, <7> 31.9767, <8> 25.539, <9> 26.6007, <10> 27.326;
param workload[JOB] := <1> 450.1738, <2> 535.9734, <3> 740.2807, <4> 532.4741, <5> 483.802, <6> 632.09, <7> 1022.5093, <8> 652.2405, <9> 707.5972, <10> 746.7103;
param capacity[MACHINE] := <1> 2167.9504, <2> 2167.9504, <3> 2167.9504;

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
