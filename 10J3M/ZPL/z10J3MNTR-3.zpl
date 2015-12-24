set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4531, <2> 24.3509, <3> 23.9063, <4> 18.1636, <5> 32.4274, <6> 19.9389, <7> 31.7269, <8> 30.9014, <9> 27.7185, <10> 20.074;
param workload[JOB] := <1> 2.9399, <2> 7.5281, <3> 30.1956, <4> 22.5594, <5> 12.8129, <6> 31.4804, <7> 32.3897, <8> 40.5097, <9> 17.3417, <10> 49.8334;
param capacity[MACHINE] := <1> 61.8977, <2> 61.8977, <3> 61.8977;

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
