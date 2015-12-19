set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.407, <2> 26.0563, <3> 30.5275, <4> 29.8016, <5> 24.3502, <6> 32.893, <7> 25.1357, <8> 24.5412, <9> 36.4865, <10> 35.0578;
param workload[JOB] := <1> 595.7016, <2> 678.9308, <3> 931.9283, <4> 888.1354, <5> 592.9322, <6> 1081.9494, <7> 631.8034, <8> 602.2705, <9> 1331.2647, <10> 1229.0493;
param capacity[MACHINE] := <1> 2140.9914, <2> 2140.9914, <3> 2140.9914;

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
