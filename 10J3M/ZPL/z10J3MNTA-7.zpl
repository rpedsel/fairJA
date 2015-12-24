set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8303, <2> 25.7588, <3> 25.7386, <4> 35.0037, <5> 29.8703, <6> 36.9779, <7> 22.2324, <8> 23.7593, <9> 28.4019, <10> 24.7468;
param workload[JOB] := <1> 616.5438, <2> 663.5158, <3> 662.4755, <4> 1225.259, <5> 892.2348, <6> 1367.3651, <7> 494.2796, <8> 564.5043, <9> 806.6679, <10> 612.4041;
param capacity[MACHINE] := <1> 1976.3125, <2> 1976.3125, <3> 1976.3125;

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
