set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7006, <2> 24.9271, <3> 25.13, <4> 28.9254, <5> 34.9875, <6> 24.3828, <7> 30.4379, <8> 30.9445, <9> 14.4695, <10> 25.9037, <11> 23.9397, <12> 26.9985, <13> 19.9399, <14> 19.235, <15> 22.9311, <16> 31.349, <17> 25.8055, <18> 22.8693, <19> 24.57, <20> 32.0747;
param workload[JOB] := <1> 23.7006, <2> 24.9271, <3> 25.13, <4> 28.9254, <5> 34.9875, <6> 24.3828, <7> 30.4379, <8> 30.9445, <9> 14.4695, <10> 25.9037, <11> 23.9397, <12> 26.9985, <13> 19.9399, <14> 19.235, <15> 22.9311, <16> 31.349, <17> 25.8055, <18> 22.8693, <19> 24.57, <20> 32.0747;
param capacity[MACHINE] := <1> 85.587, <2> 85.587, <3> 85.587, <4> 85.587, <5> 85.587, <6> 85.587;

var x[JM];
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
