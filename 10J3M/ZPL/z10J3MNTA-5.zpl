set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.7357, <2> 16.9579, <3> 17.8799, <4> 16.2012, <5> 34.7224, <6> 29.6566, <7> 16.5705, <8> 27.1979, <9> 19.7497, <10> 24.051;
param workload[JOB] := <1> 314.5551, <2> 287.5704, <3> 319.6908, <4> 262.4789, <5> 1205.6451, <6> 879.5139, <7> 274.5815, <8> 739.7258, <9> 390.0507, <10> 578.4506;
param capacity[MACHINE] := <1> 1313.0657, <2> 1313.0657, <3> 1313.0657;

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
