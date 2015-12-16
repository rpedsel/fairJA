set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.4028, <2> 26.1404, <3> 38.3106, <4> 42.3134, <5> 20.5177, <6> 2.4208, <7> 20.8865, <8> 38.6949, <9> 27.8685, <10> 35.4192, <11> 34.561, <12> 10.9791, <13> 41.7484, <14> 33.0107, <15> 42.9643, <16> 16.8087, <17> 23.5066, <18> 42.6407, <19> 18.7465, <20> 16.6447;
param workload[JOB] := <1> 7.4028, <2> 26.1404, <3> 38.3106, <4> 42.3134, <5> 20.5177, <6> 2.4208, <7> 20.8865, <8> 38.6949, <9> 27.8685, <10> 35.4192, <11> 34.561, <12> 10.9791, <13> 41.7484, <14> 33.0107, <15> 42.9643, <16> 16.8087, <17> 23.5066, <18> 42.6407, <19> 18.7465, <20> 16.6447;
param capacity[MACHINE] := <1> 90.2642, <2> 90.2642, <3> 90.2642, <4> 90.2642, <5> 90.2642, <6> 90.2642;

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
