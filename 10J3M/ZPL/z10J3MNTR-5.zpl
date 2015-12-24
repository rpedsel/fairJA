set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.2571, <2> 34.4268, <3> 26.1322, <4> 35.4216, <5> 21.3362, <6> 31.0539, <7> 26.2154, <8> 26.5611, <9> 28.4309, <10> 30.5048;
param workload[JOB] := <1> 11.5742, <2> 48.764, <3> 24.8739, <4> 1.3272, <5> 3.2381, <6> 35.6984, <7> 3.8172, <8> 15.6355, <9> 31.4523, <10> 21.6256;
param capacity[MACHINE] := <1> 49.5016, <2> 49.5016, <3> 49.5016;

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
