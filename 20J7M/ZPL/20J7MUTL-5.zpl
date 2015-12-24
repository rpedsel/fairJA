set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.3345, <2> 32.4505, <3> 23.8332, <4> 7.0745, <5> 2.3738, <6> 10.229, <7> 35.7031, <8> 34.3896, <9> 33.7385, <10> 9.4172, <11> 49.5399, <12> 49.9181, <13> 47.3861, <14> 48.7516, <15> 33.5326, <16> 14.5746, <17> 1.6079, <18> 3.2474, <19> 7.7783, <20> 10.2455;
param workload[JOB] := <1> 46.3345, <2> 32.4505, <3> 23.8332, <4> 7.0745, <5> 2.3738, <6> 10.229, <7> 35.7031, <8> 34.3896, <9> 33.7385, <10> 9.4172, <11> 49.5399, <12> 49.9181, <13> 47.3861, <14> 48.7516, <15> 33.5326, <16> 14.5746, <17> 1.6079, <18> 3.2474, <19> 7.7783, <20> 10.2455;
param capacity[MACHINE] := <1> 53.7992, <2> 53.7992, <3> 53.7992, <4> 53.7992, <5> 53.7992, <6> 53.7992, <7> 53.7992;

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
