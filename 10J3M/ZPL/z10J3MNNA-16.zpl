set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.1862, <2> 15.8733, <3> 33.8303, <4> 13.6849, <5> 36.6345, <6> 31.3736, <7> 16.7123, <8> 13.8334, <9> 29.1321, <10> 24.4003;
param workload[JOB] := <1> 448.8551, <2> 251.9617, <3> 1144.4892, <4> 187.2765, <5> 1342.0866, <6> 984.3028, <7> 279.301, <8> 191.363, <9> 848.6793, <10> 595.3746;
param capacity[MACHINE] := <1> 6273.6898, <2> 6273.6898, <3> 6273.6898;

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
